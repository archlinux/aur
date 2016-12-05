# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=libbiosig
pkgver=1.8.4
pkgrel=1
pkgdesc="Provides reading and writing routines for different biosignal data formats"
arch=('i686' 'x86_64')
url="http://biosig.sourceforge.net/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://sourceforge.net/projects/biosig/files/BioSig%20for%20C_C%2B%2B/src/biosig4c%2B%2B-1.8.4.src.tar.gz
        libbiosig.patch)
noextract=()
sha1sums=('8eac7b700ef99dda906f0ed93986a5a07b72d693'
          'e92db239599e8d13d9532fff561f236d89a922ae')

build() {
  patch "$srcdir/biosig4c++-$pkgver/Makefile" libbiosig.patch
  cd "$srcdir/biosig4c++-$pkgver"
  make libbiosig
}

package() {
  mkdir -p "$pkgdir/usr/include"
  mkdir -p "$pkgdir/usr/lib"
  cp "$srcdir/biosig4c++-$pkgver/biosig.h" "$pkgdir/usr/include"
  cp "$srcdir/biosig4c++-$pkgver/gdftime.h" "$pkgdir/usr/include"
  cp "$srcdir/biosig4c++-$pkgver/libbiosig.a" "$pkgdir/usr/lib"
  cp "$srcdir/biosig4c++-$pkgver/libbiosig.so" "$pkgdir/usr/lib"
}
