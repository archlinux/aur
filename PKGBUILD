# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=mimetex
pkgver=1.70
pkgrel=4
pkgdesc="tex to gif converter"
arch=(x86_64)
url="http://www.forkosh.com/mimetex.html"
license=('GPL')
depends=()
source=(https://sources.archlinux.org/other/community/mimetex/mimetex.zip)
md5sums=('c73b1dde70526edb137daaf72189024b')

build() {
  cd "$srcdir"
  gcc -DAA mimetex.c gifsave.c -lm -o mimetex.cgi
}

package() {
  cd "$srcdir"
  install -D -m0755 mimetex.cgi "$pkgdir"/usr/bin/mimetex.cgi
}
