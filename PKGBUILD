# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmcdplay
pkgdesc="A CD player WindowMaker dock app"
pkgver=1.1
pkgrel=1
arch=(i686 x86_64)
url="http://windowmaker.org/dockapps/?name=$pkgname"
license=('GPL')
depends=('libxpm')
makedepends=('imake')
source=("$pkgname-$pkgver.tar.gz::http://windowmaker.org/dockapps/?download=$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')
prepare() {
  cd "${srcdir}"/dockapps-c39c8d6
  autoreconf -iv
}

build() {
  cd "${srcdir}"/dockapps-c39c8d6
  ./configure --prefix=/usr --bindir=/usr/bin --mandir=/usr/share/man
  make V=0
}

package() {
  cd "${srcdir}"/dockapps-c39c8d6
  make DESTDIR="$pkgdir" install
}

