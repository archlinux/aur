# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=batman-alfred
pkgver=2014.0.0
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
sha256sums=('90edf633f02822717d7d6a128a869098f31f1c7d8be94b187f0cdb39655f12eb')
