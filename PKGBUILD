# Contributor foutrelis
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mimetex
pkgver=1.76
_pkgver=1.75
pkgrel=1
pkgdesc="tex to gif converter"
arch=('x86_64')
url="http://www.forkosh.com/mimetex.html"
license=('GPL3')
source=("http://deb.debian.org/debian/pool/main/m/$pkgname/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('37edf717cc8bf3ba78cf53080ec3d5fff576653c8c7d762e05055d183582814f')

build() {
  cd $pkgname-$_pkgver
  gcc -DAA mimetex.c gifsave.c -lm -o mimetex.cgi
}

package() {
  cd $pkgname-$_pkgver
  install -D -m0755 mimetex.cgi "$pkgdir"/usr/bin/mimetex.cgi
}
