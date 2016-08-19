# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmtv
pkgver=0.6.6
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="dockable video4linux TV player dockapp"
url="http://www.dockapps.net/${pkgname}"
license=("GPL")
depends=('libxpm' 'libxxf86vm')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('c21417cbdec0c44fbe5d0e17e3cee657')

prepare() {
  cd dockapps-*
  autoreconf -fiv
}

build() {
  cd dockapps-*
  ./configure --prefix=/usr  --mandir=/usr/share/man
  make V=0
}

package() {
  cd dockapps-*
  make DESTDIR="$pkgdir" install
}

