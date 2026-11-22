# Maintainer: agony <27015 at riseup dot net>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=batman-alfred
pkgver=2026.4
pkgrel=1
pkgdesc='Almighty Lightweight Fact Remote Exchange Daemon'
arch=('x86_64')
url='http://www.open-mesh.net/'
license=('GPL-2.0-only')
source=("http://downloads.open-mesh.net/batman/releases/batman-adv-${pkgver}/alfred-${pkgver}.tar.gz"
	"http://downloads.open-mesh.net/batman/releases/batman-adv-${pkgver}/alfred-${pkgver}.tar.gz.asc")
sha256sums=('9d1f5c784608d0f8f0dba5b4601f5c3c5cd1edeb6c671fe3212b08f855fd70a9'
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

