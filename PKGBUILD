# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=astrolog
pkgver=7.80
pkgrel=1
pkgdesc='A 100% freeware astrology program'
url='http://www.astrolog.org'
arch=('x86_64')
license=('GPL-2.0-only')
source=("$url/ftp/ast78src.zip")
sha512sums=('71c336353e1cbeaab968c62f1629a01a87187a099d3ed384287aada6432ec52527673c013d8212820c9fa793bb2da1dea1c19092dd8cd7dfc490effa03a6b89b')

build() {
  cc -c -O *.cpp
  cc -o astrolog *.o -lm -lX11 -ldl
  strip $pkgname
}

package() {
  install -Dm644 "license.htm" "$pkgdir/usr/share/licenses/${pkgname}/license.htm"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

