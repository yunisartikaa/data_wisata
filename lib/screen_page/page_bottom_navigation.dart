
import 'package:flutter/material.dart';
import 'package:data_wisata/screen_page/page_maps_wisata.dart';
import 'package:data_wisata/screen_page/page_wisata.dart';


class PageBottomNavigationBar extends StatefulWidget {
  const PageBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<PageBottomNavigationBar> createState() => _PageBottomNavigationBarState();
}

class _PageBottomNavigationBarState extends State<PageBottomNavigationBar> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {

    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          PageWisata(),
          MapsAllPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          controller: tabController,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Icon(Icons.place),
                    ),
                    Text("Home"),
                  ],
                ),
              ),
            ),
            Tab(
              child: SingleChildScrollView(// Custom layout for Tab
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 4),  // Control spacing between icon and text
                      child: Icon(Icons.maps_home_work),
                    ),
                    Text("Favorite"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
