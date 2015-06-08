# Maintainer: Jameson Pugh <imntreal@gmail.com>
pkgname=openzwave
pkgver=1.2.919
pkgrel=1
pkgdesc="Opensource Z-Wave control"
url="http://www.openzwave.com"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libsystemd')
makedepends=('doxygen')
source=("http://old.openzwave.com/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('473229f3dd3d6b260e6584b17e5c5f2e09e61805f89763f486a9f7aa2b4181ba')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} PREFIX=/usr instlibdir=usr/lib/ sysconfdir=etc/${pkgname} install
}

# vim:set ts=2 sw=2 et:
