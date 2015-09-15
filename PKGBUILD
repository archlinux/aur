# Maintainer: Charles Goyard <cg@fsck.fr>

pkgname=xapian-tcl-bindings
_realname=xapian-bindings
pkgver=1.2.21
pkgrel=1
pkgdesc="Bindings allowing Xapian to be used from Tcl"
arch=(i686 x86_64)
url="http://xapian.org/docs/bindings/tcl/"
license=('GPL')
groups=(xapian)
depends=('tcl' 'xapian-core')
makedepends=('gcc')
source=(http://oligarchy.co.uk/xapian/${pkgver}/${_realname}-$pkgver.tar.xz)
md5sums=('33c598a26fcf92ab15af6c65475ab8de')

build() {
  cd "$srcdir/${_realname}-$pkgver"
  ./configure --prefix=/usr --with-tcl TCL_LIB=/usr/lib/tcllib
  make
}

package() {
  cd "$srcdir/${_realname}-$pkgver"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
