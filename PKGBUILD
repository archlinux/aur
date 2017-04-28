# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=kasync
pkgver=0.1.1
pkgrel=1
pkgdesc='A C++ library for controlling asynchronous tasks'
arch=(i686 x86_64)
url='https://community.kde.org/KDE_PIM'
license=(GPL)
depends=(qt5-base)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
sha256sums=('a7fceb7ed16ec1785eee418602b040989122ee6be43e2727e996f8bf19d50d0d')

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
