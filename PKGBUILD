# Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=libosmocore
pkgver=1.0.1
pkgrel=1
pkgdesc="core libs for osmocom"
arch=('x86_64' 'i686')
url="http://bb.osmocom.org/trac/wiki/libosmocore"
license=('GPL')
groups=()
provides=()
depends=('pcsclite')
makedepends=('autoconf' 'automake' 'make' 'gcc' 'libtool' 'git' 'pkg-config' 'talloc')

source=("git://git.osmocom.org/libosmocore.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  autoreconf -i
  ./configure --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --datadir=/usr/share \
              --libexecdir=/usr/lib --localstatedir=/var --docdir=/usr/share/doc/libosmocore --libdir=/usr/lib/
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install
}
