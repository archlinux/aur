# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmcdplay
pkgdesc="A CD player WindowMaker dock app"
pkgver=1.1
pkgrel=3
arch=(i686 x86_64)
url="http://www.dockapps.net/wmcdplay"
license=('GPL')
depends=('libxpm')
makedepends=('imake')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('57c034302114e161a0f1b4038b2e7e51')

prepare() {
  cd dockapps
  autoreconf -iv
}

build() {
  cd dockapps
  ./configure --prefix=/usr --bindir=/usr/bin --mandir=/usr/share/man
  make V=0
}

package() {
  cd dockapps
  make DESTDIR="$pkgdir" install
}
