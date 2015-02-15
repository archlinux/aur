# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=batman-alfred
pkgver=2014.4.0
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

sha256sums=('99e6c64e7069b0b7cb861369d5c198bfc7d74d41509b8edd8a17ba78e7c8d034')
