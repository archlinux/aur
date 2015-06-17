# Maintainer: Maxime de Roucy <maxime.deroucy@gmail.com>

pkgname=libu2f-server
pkgver=0.0.0
pkgrel=1
pkgdesc="Yubico Universal 2nd Factor (U2F) Server C Library"
arch=('i686' 'x86_64')
url='https://developers.yubico.com/libu2f-server/'
license=('BSD')
depends=('openssl' 'json-c')
makedepends=('check')
source=("https://developers.yubico.com/libu2f-server/Releases/${pkgname}-${pkgver}.tar.xz")

build() {
	cd ${pkgname}-${pkgver}/

	./configure --prefix=/usr
	make
}

check() {
	cd ${pkgname}-${pkgver}/

	make check
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}/" install

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

sha256sums=('e072604a35a4450458a08415afee77d3f3d4ea09fc2302cd35f1babf151eb4ed')
