# Maintainer: Daniel Wilhelm <shieldwed [at] outlook [dot] com>

pkgname=bittwist
pkgver=2.0
pkgrel=1
pkgdesc='Libpcap-based Ethernet packet generator'
url='http://bittwist.sourceforge.net'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libpcap>=1.2.1')

source=("http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-linux-${pkgver}.tar.gz")

sha256sums=('7b98123d2bcb9bec59dc5e610c0c5b5749ef2ed83418956c3ddef3cf5824ea45')

build() {
  cd "${srcdir}/${pkgname}-linux-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-linux-${pkgver}"
  make prefix="${pkgdir}/usr" install
}
# vim:set ts=2 sw=2 et:
