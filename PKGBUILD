# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=cm256cc
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast GF(256) Cauchy MDS Block Erasure Codec in C++"
arch=('x86_64' 'i686')
url="https://github.com/f4exb/cm256cc"
depends=('boost')
license=('BSD')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2a9f0fc5d8534fffeb368632cf6942fe652e5b8d65a9a0d7628fefb085313acb')

build() {
  mkdir -p "$srcdir"/$pkgname-$pkgver/build
  cd "$srcdir"/$pkgname-$pkgver/build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/build

  make DESTDIR="$pkgdir" install
}
