# $Id$

_pkgname=erlang-serial
pkgname=${_pkgname}-git
pkgver=r28.3f53d2a
pkgrel=1
pkgdesc="Erlang driver for serial communication."
arch=('any')
url="https://github.com/tonyg/erlang-serial"
license=('MIT')
depends=('erlang-nox')
makedepends=('git')
source=("$_pkgname::git://github.com/tonyg/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR=$pkgdir/usr/lib make install
}
