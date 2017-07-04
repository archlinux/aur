# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=kasync
pkgver=0.2.0
pkgrel=1
pkgdesc='A C++ library for controlling asynchronous tasks'
arch=(i686 x86_64)
url='https://community.kde.org/KDE_PIM'
license=(GPL)
depends=(qt5-base)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
sha256sums=('0ff75cf4cbef3baff2ffd061bac737e7b05bd0f24f7a89ac83c4ea17a5ba4ac3')

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
