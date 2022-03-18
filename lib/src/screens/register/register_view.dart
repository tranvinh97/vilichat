import 'package:chat_app/src/screens/register/register_controller.dart';
import 'package:chat_app/src/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterController _registerController;

  @override
  void initState() {
    super.initState();
    _registerController = RegisterController(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _registerController.streamController.stream,
        builder: (context, snapshot) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: IconButton(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(0),
                              color: Colors.blue,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Text(
                            'Create',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Create an account on ViliChatApp.',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          TextField(
                            cursorColor: Theme.of(context).primaryColor,
                            controller: _registerController.nameController,
                            decoration: InputDecoration(labelText: 'Full name'),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            cursorColor: Theme.of(context).primaryColor,
                            controller: _registerController.usernameController,
                            decoration: InputDecoration(labelText: 'User name'),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            cursorColor: Theme.of(context).primaryColor,
                            controller: _registerController.passwordController,
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          MyButton(
                            title: _registerController.formSubmitting
                                ? 'CREATING...'
                                : 'CREATE AN ACCOUNT',
                            onTap: _registerController.submitForm,
                            disabled: !_registerController.isFormValid ||
                                _registerController.formSubmitting,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
