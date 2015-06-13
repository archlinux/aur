# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Oguz Han Asnaz <O.Asnaz@gmx.net>

pkgname=rpncalc
pkgver=1.36.8
pkgrel=2
pkgdesc="A calculator similar to dc, but uses readline and shows the stack visually."
arch=('i686' 'x86_64')
#url="http://packages.debian.org/squeeze/rpncalc"
url="http://homepage.hispeed.ch/david.frey/"
license=('GPL2')
depends=('readline')
makedepends=('bison' 'flex' 'gettext' 'ed')
source=("http://ftp.de.debian.org/debian/pool/main/r/${pkgname}/${pkgname}_${pkgver}.tar.gz")
md5sums=('53c56b3cc539f214c2c26d5af62d878d')

build() {
  cd "$srcdir/$pkgname"
  sed -i 's|ed .* proto.ed$|LANG=C &|' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
