# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Todd Musall <tmusall@comcast.net>
# Contributor: Todd Musall <tmusall@comcast.net>

pkgname=datemath
pkgver=2.0.10
pkgrel=5
pkgdesc="Command line date and time math utility."
arch=('x86_64')
url="http://www.unixwiz.net/tools/datemath.html"
license=("GPL")
depends=('glibc')
source=(http://www.unixwiz.net/tools/$pkgname.tar.gz
	y2k.patch)
md5sums=('2c369d70a43313b71dbe3c7cc50207de'
         '87758503414a967f06566b94523fc010')

build() {
  cd "$srcdir"
  patch -Np0 <"$srcdir"/y2k.patch
  make
}

package() {
  cd "$srcdir"
  install -D -m755 "$srcdir"/datemath "$pkgdir"/usr/bin/datemath
}
