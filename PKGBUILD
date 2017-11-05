# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=atcore
confilicts=('atcore-git')
provides=('atcore')
pkgver=0.90.2
pkgrel=1
pkgdesc="KDE 3D Printing libary"
arch=('i686' 'x86_64')
url="https://www.kde.org/"
license=('LGPL2')
buildDepends=('git' 'cmake' 'extra-cmake-modules')
depends=('qt5-base' 'qt5-serialport' 'qt5-charts' ) #Qt5)
source=('http://download.kde.org/unstable/atcore/atcore-0.90.2.tar.xz')
sha256sums=('02790ea72435227de42a232155f0f51990a637b724fc244e277ff5fbae2c1fd5')

build() {
  cd "atcore-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=$(qtpaths --install-prefix) -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=Release -DBUILD_TEST_GUI=ON CMakeLists.txt 
  make
}
package(){
  cd "atcore-$pkgver"
  make DESTDIR="$pkgdir/" install 
}  
