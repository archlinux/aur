# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=kdeplasma-runners-vbox
_srcname=vbox-runner
pkgver=0.4.1
pkgrel=1
pkgdesc="Allows starting VirtualBox virtual machines from Krunner (Plasma 5 version)"
arch=('i686' 'x86_64')
depends=('plasma-workspace>=5')
makedepends=('cmake' 'extra-cmake-modules')
url="http://kde-apps.org/content/show.php/VBox+Runner?content=174305"
license=('GPL')
source=(http://kde-apps.org/CONTENT/content-files/174305-${_srcname}-${pkgver}.zip)
sha1sums=('e9d0f744c6188dc28ccb4cdeebaf36c9bff1561e')

prepare() {
	mkdir -p build
}
  
build()
{
	cd build
      
	cmake ../${_srcname}-master \
		-DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` \
		-DQT_PLUGIN_INSTALL_DIR=`kf5-config --qt-plugins` \
		-DCMAKE_BUILD_TYPE=Release
	make
}
          		  	   
package()
{
	cd build
	make DESTDIR=${pkgdir} install
}
