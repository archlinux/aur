# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=batman-alfred
pkgver=2021.3
pkgrel=1
pkgdesc='Almighty Lightweight Fact Remote Exchange Daemon'
arch=('i686' 'x86_64')
url='http://www.open-mesh.net/'
license=('GPL')
source=("http://downloads.open-mesh.net/batman/releases/batman-adv-${pkgver}/alfred-${pkgver}.tar.gz")
depends=('gpsd' 'libnl' 'libcap')

build(){
  cd "${srcdir}/alfred-${pkgver}"
  make
}
package() {
  cd "${srcdir}/alfred-${pkgver}"
  make DESTDIR="${pkgdir}"  PREFIX=/usr SBINDIR=/usr/bin install
}

sha256sums=('be6229edf2a3e9cf69122e5283d113e9405f1455e8fd4ebd55294e9bf9157b5a')
