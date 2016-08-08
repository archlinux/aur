# Maintainer: Jameson Pugh <imntreal@gmail.com>
pkgname=openzwave
pkgver=1.4.1
pkgrel=1
pkgdesc="Opensource Z-Wave control"
url="http://www.openzwave.com"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libsystemd')
makedepends=('doxygen')
source=("http://old.openzwave.com/downloads/openzwave-${pkgver}.tar.gz")
sha256sums=('171556c3583a66203c6a1a7453414ff126a36b5d83ec50ac9bfb227127ff705e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} PREFIX=/usr instlibdir=usr/lib/ sysconfdir=etc/${pkgname} install
}

# vim:set ts=2 sw=2 et:
