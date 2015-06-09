# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=batman-alfred
pkgver=2015.0
pkgrel=1
pkgdesc='Almighty Lightweight Fact Remote Exchange Daemon'
arch=('i686' 'x86_64')
url='http://www.open-mesh.net/'
license=('GPL')
source=("http://downloads.open-mesh.net/batman/releases/batman-adv-${pkgver}/alfred-${pkgver}.tar.gz")
depends=('gpsd')

build(){
  cd "${srcdir}/alfred-${pkgver}"
  make
}
package() {
  cd "${srcdir}/alfred-${pkgver}"
  make DESTDIR="${pkgdir}"  PREFIX=/usr SBINDIR=/usr/bin install
}

sha256sums=('c66a20e5814b4afefa7b07370e20cc9a01b5f31ef9c554d132778f89e5ba736c')
