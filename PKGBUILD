# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=atcore
conflicts=('atcore-git')
provides=('atcore')
pkgver=1.0.0
pkgrel=1
pkgdesc="KDE 3D Printing libary"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://www.kde.org/"
license=('LGPL2')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'doxygen')
depends=('qt5-base' 'qt5-serialport' 'qt5-charts' ) #Qt5)
source=('https://download.kde.org/stable/atcore/1.0.0/atcore-1.0.0.tar.xz')
sha256sums=('ffd12455c9b8db853e455a437d6c6b601e0003c6732bbc6c2828032e004530e2')

build() {
  cd "atcore-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=$(qtpaths --install-prefix) -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=Release -DBUILD_TEST_GUI=ON -DBUILD_DOCS=ON CMakeLists.txt 
  make
}
package(){
  cd "atcore-$pkgver"
  make DESTDIR="$pkgdir/" install 
}  
