# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=kasync
pkgver=0.1.0
pkgrel=1
pkgdesc='A C++ library for controlling asynchronous tasks'
arch=(i686 x86_64)
url='https://community.kde.org/KDE_PIM'
license=(GPL)
depends=(qt5-base)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
sha256sums=('f69fe2ca9b4f533dda268d27f072abf0947cc451662fcf5c2f67cbebdeb03020')

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
