# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Lawrence Lee <valheru at facticius dot net>
pkgname=gle-te
pkgver=3.1.0
pkgrel=1
pkgdesc="a library of C functions that draw extruded surfaces, including surfaces of revolution, sweeps, tubes, polycones, polycylinders and helicoids."
arch=('i686' 'x86_64')
url="http://www.linas.org/gle/index.html"
license=('GPL')
depends=('libgl')
makedepends=('gcc' 'glut')
source=(http://downloads.sourceforge.net/gle/gle-$pkgver.tar.gz)
md5sums=('da5b45c6906343d4a3672c3de35513ad')
options=(!libtool)

build() {
  cd "$srcdir/gle-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share
  make
}

package() {
  cd "$srcdir/gle-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
