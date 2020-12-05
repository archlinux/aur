# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: trya <tryagainprod@gmail.com>

pkgname=quazip-legacy
_pkgname=quazip
pkgver=0.9.1
pkgrel=1
pkgdesc="C++ wrapper for the Gilles Vollant's ZIP/UNZIP C package (Legacy version)"
url="https://stachenov.github.io/quazip/"
license=(LGPL)
arch=(x86_64)
depends=(qt5-base)
makedepends=(cmake)
source=($_pkgname-$pkgver.tar.gz::https://github.com/stachenov/$_pkgname/archive/v$pkgver.tar.gz)
sha256sums=('5d36b745cb94da440432690050e6db45b99b477cfe9bc3b82fd1a9d36fff95f5')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
