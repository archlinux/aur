# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=cattle
pkgver=1.2.0
pkgrel=1
pkgdesc='Toolkit for the Brainfuck programming language'
arch=('x86_64' 'i686')
url='http://kiyuko.org/software/cattle'
license=('GPL')
depends=('glib2')
options=('!libtool')
source=("$pkgname-$pkgver.tgz::http://kiyuko.org/software/$pkgname/releases/$pkgver/source")
sha256sums=('d1ff3084d097db308f39f8a53f8679d5accf62fc96a4285a213289a0858b13c0')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname-$pkgver" install DESTDIR="$pkgdir"
}

# getver: kiyuko.org/software/cattle/releases
# vim:set ts=2 sw=2 et:
