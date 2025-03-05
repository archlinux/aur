# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=libxdf
pkgver=0.99.9
pkgrel=2
pkgdesc="A C++ library for loading XDF files"
arch=('i686' 'x86_64')
url="https://github.com/xdf-modules/libxdf"
license=('GPL')
groups=()
depends=()
makedepends=('qt5-base')
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
sha1sums=('8f76aa71db66030b67ecfb4a577628f4cd9c6c12')

build() {
  cd "$srcdir/libxdf-$pkgver"
  qmake
  make
}

package() {
  mkdir -p "$pkgdir/usr/include"
  mkdir -p "$pkgdir/usr/lib"
  cp "$srcdir/libxdf-$pkgver/xdf.h" "$pkgdir/usr/include"
  cp "$srcdir/libxdf-$pkgver/libxdf.a" "$pkgdir/usr/lib"
}
