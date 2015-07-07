# Maintainer: Jameson Pugh <imntreal@gmail.com>
pkgname=openzwave-snapshot
pkgver=1.3.401
pkgrel=1
pkgdesc="Opensource Z-Wave control code snapshots"
url="http://www.openzwave.com"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libsystemd')
makedepends=('doxygen')
conflicts=('openzwave')
provides=('openzwave')
source=("http://old.openzwave.com/snapshots/openzwave-${pkgver}.tar.gz")
sha256sums=('d80a551701ebbc3121bfa4172de7e067ab6d50d1a47a1340ab056a0598eaf2b2')

build() {
  cd ${srcdir}/openzwave-${pkgver}
  make
}

package() {
  cd ${srcdir}/openzwave-${pkgver}
  make DESTDIR=${pkgdir} PREFIX=/usr instlibdir=usr/lib/ sysconfdir=etc/${pkgname} install
}

# vim:set ts=2 sw=2 et:
