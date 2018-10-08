# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=libbiosig
pkgver=1.9.2
pkgrel=1
pkgdesc="Reading and writing routines for different biosignal data formats"
arch=('i686' 'x86_64')
url="http://biosig.sourceforge.net/"
license=('GPL')
groups=()
depends=('zlib' 'suitesparse')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(staticlibs)
install=
changelog=
source=(https://sourceforge.net/projects/biosig/files/BioSig%20for%20C_C%2B%2B/src/biosig4c%2B%2B-1.9.2.src.tar.gz)
noextract=()
sha1sums=('4d86cbd27aad1f335a1902c642a6dd339313cf26')

build() {
  cd "$srcdir/biosig4c++-$pkgver"
  ./configure
  make libbiosig
}

package() {
  mkdir -p "$pkgdir/usr/include"
  mkdir -p "$pkgdir/usr/lib"
  cp "$srcdir/biosig4c++-$pkgver/biosig.h" "$pkgdir/usr/include/"
  cp "$srcdir/biosig4c++-$pkgver/biosig-dev.h" "$pkgdir/usr/include/"
  cp "$srcdir/biosig4c++-$pkgver/physicalunits.h" "$pkgdir/usr/include/"
  cp "$srcdir/biosig4c++-$pkgver/gdftime.h" "$pkgdir/usr/include/"
  cp "$srcdir/biosig4c++-$pkgver/libbiosig.a" "$pkgdir/usr/lib/"
  cp "$srcdir/biosig4c++-$pkgver/libbiosig.so.2" "$pkgdir/usr/lib/"
  ln -s "$srcdir/biosig4c++-$pkgver/libbiosig.so.2" "$pkgdir/usr/lib/libbiosig.so"
}
