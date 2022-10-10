# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=libbiosig
pkgver=2.4.3
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
source=(https://sourceforge.net/projects/biosig/files/BioSig%20for%20C_C%2B%2B/src/biosig-$pkgver.src.tar.xz)
noextract=()
sha1sums=('82bb71a5f2830ee8ded9b4237fb3526e6cadfc75')

build() {
  cd "$srcdir/biosig-$pkgver"
  ./configure
  make lib
}

package() {
  mkdir -p "$pkgdir/usr/include"
  mkdir -p "$pkgdir/usr/lib/pkgconfig"
  cp "$srcdir/biosig-$pkgver/biosig4c++/biosig.h" "$pkgdir/usr/include/"
  cp "$srcdir/biosig-$pkgver/biosig4c++/biosig-dev.h" "$pkgdir/usr/include/"
  cp "$srcdir/biosig-$pkgver/biosig4c++/physicalunits.h" "$pkgdir/usr/include/"
  cp "$srcdir/biosig-$pkgver/biosig4c++/gdftime.h" "$pkgdir/usr/include/"
  cp "$srcdir/biosig-$pkgver/biosig4c++/libbiosig.a" "$pkgdir/usr/lib/"
  cp "$srcdir/biosig-$pkgver/biosig4c++/libbiosig.so" "$pkgdir/usr/lib/"
  cp "$srcdir/biosig-$pkgver/biosig4c++/libbiosig.pc" "$pkgdir/usr/lib/pkgconfig/"
}
