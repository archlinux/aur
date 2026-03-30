# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='File list utility with features from ls(1), find(1), stat(1), and du(1)'
pkgname=lr
pkgver=2.0.1
pkgrel=1
url=https://github.com/leahneukirchen/lr
arch=(x86_64)
depends=(glibc)
license=(MIT)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('dca9cc3a7ee5f092a07ce83db548b75195466339bdb13c3bb960d48b75827c7a70b3b3d6d6fa29b6f2d3a72f2ab4286cd10256b3882c4c61bb6afc093ace3226')

build () {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr
}

package () {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
