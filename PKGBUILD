# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Florian Knodt <adlerweb@adlerweb.info>
pkgname=xbrightness
pkgver=0.3
pkgrel=3
pkgdesc="Software X11 brightness control"
arch=('i686' 'x86_64')
url="http://shallowsky.com/software/xbrightness/"
license=('custom')
groups=('x11')
depends=('libxmu' )
source=(http://shallowsky.com/software/xbrightness/xbrightness-0.3-mika-akk.tar.gz)
noextract=()
md5sums=('3b7a35a67407ffc07aed9dd8b42caa68')

build() {
  cd "$srcdir/xbrightness-0.3-mika-akk"
  sed -i "s/ -m32//g" Makefile
  make all || return 1
}
package() {
  cd "$srcdir/xbrightness-0.3-mika-akk"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
