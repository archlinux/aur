# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=ttm
pkgver=4.04
pkgrel=2
pkgdesc="TeX to MathML translator"
url="http://hutchinson.belmont.ma.us/tth/"
arch=('i686' 'x86_64')
optdepends=('tth: for providing some scripts ttm could also use')
license=('GPL')
source=(http://hutchinson.belmont.ma.us/tth/mml/ttmC.tar.gz)
md5sums=('491aefd525efa804c5a203c5a8c4a281')

build() {
  cd "$srcdir/ttmC"
  gcc -o ttm ttm.c 
}

package() {
  cd "$srcdir/ttmC"
  install -D -m755 tth $pkgdir/usr/bin/ttm
  install -D -m644 ttm_manual.html \
    $pkgdir/usr/share/doc/ttm/ttm_manual.html 
  install -D -m644 README $pkgdir/usr/share/doc/ttm/README
}
