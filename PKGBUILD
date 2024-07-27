# Contributor: Hermann Gessl <h.gessl@aon.at>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=wmtop
pkgver=0.85
pkgrel=1
pkgdesc="wmapplet for monitoring cpu usage"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.dockapps.net/wmtop"
depends=('libxpm' 'libdockapp')
makedepends=('xorg-server')
source=("https://www.dockapps.net/download/wmtop-0.85.tar.gz")
md5sums=('286fdcca77a8429ae1e99e618ea6b140')

build() {
  cd "$srcdir/dockapps-be3f170"
  autoreconf -fvi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/dockapps-be3f170"
  make DESTDIR="$pkgdir/" install
}

# vim: set sw=2 et:
