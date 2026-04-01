# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=libxdf
pkgver=0.99.10
pkgrel=1
pkgdesc="A C++ library for loading XDF files"
arch=('i686' 'x86_64')
url="https://github.com/xdf-modules/libxdf"
license=('GPL')
groups=()
depends=()
makedepends=('cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=(https://github.com/xdf-modules/libxdf/archive/v$pkgver.zip)
noextract=()
sha1sums=('3e684e6553ea723331bae2e7c73221113dc90553')

build() {
  cd "$srcdir/libxdf-$pkgver"
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  mkdir -p "$pkgdir/usr/include"
  mkdir -p "$pkgdir/usr/lib"
  cp "$srcdir/libxdf-$pkgver/xdf.h" "$pkgdir/usr/include"
  cp "$srcdir/libxdf-$pkgver/build/libxdf.a" "$pkgdir/usr/lib"
}
