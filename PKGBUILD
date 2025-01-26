# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=batman-alfred
pkgver=2024.4
pkgrel=1
pkgdesc='Almighty Lightweight Fact Remote Exchange Daemon'
arch=('i686' 'x86_64')
url='http://www.open-mesh.net/'
license=('GPL-2.0-only')
source=("http://downloads.open-mesh.net/batman/releases/batman-adv-${pkgver}/alfred-${pkgver}.tar.gz"
	"http://downloads.open-mesh.net/batman/releases/batman-adv-${pkgver}/alfred-${pkgver}.tar.gz.asc")
sha256sums=('d3a5ad906b728036e4735f9d64a72b9731f16f81f3d8df40cb478591a3bd2294'
            'SKIP')
depends=('glibc' 'gpsd' 'libnl' 'libcap')

build(){
	cd "${srcdir}/alfred-${pkgver}"

	make
}

package() {
	cd "${srcdir}/alfred-${pkgver}"

	make DESTDIR="${pkgdir}"  PREFIX=/usr SBINDIR=/usr/bin install
}

