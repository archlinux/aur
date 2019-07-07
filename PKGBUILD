# Maintainer: Mélanie Chauvel (ariasuni) <perso at hack-libre dot org>

pkgname=nuspell
pkgver=2.2.0
pkgrel=3
pkgdesc='Free and open source C++ spell checking library'
arch=('x86_64')
license=('LGPL3+')
depends=('boost-libs' 'icu')
makedepends=('boost' 'cmake')
source=("git+https://github.com/nuspell/nuspell#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd nuspell
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  cd nuspell/build
  make DESTDIR="$pkgdir" install
}
