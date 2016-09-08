# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kio-gdrive
pkgver=0.9.81
pkgrel=1
arch=(i686 x86_64)
pkgdesc="KIO Slave to access Google Drive"
url="https://projects.kde.org/kio-gdrive"
license=(GPL)
depends=(libkgapi qtkeychain)
makedepends=(extra-cmake-modules git kdesignerplugin)
source=(http://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz)
md5sums=('04049f497f3fd1339a42f9edad6f3a12')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
}
