# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <j@codemac.net>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=rexima
pkgver=1.4
pkgrel=6
pkgdesc="A curses-based interactive mixer."
arch=('x86_64')
url="http://www.svgalib.org/rus/rexima.html"
license=('GPL')
depends=('ncurses')
source=(ftp://ftp.ibiblio.org/pub/Linux/apps/sound/mixers/${pkgname}-${pkgver}.tar.gz)
md5sums=('333a4db26409b9cca9b9e96ddf42f44c')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make PREFIX="$pkgdir"/usr MANDIR="$pkgdir"/usr/share/man/man1 install
}
