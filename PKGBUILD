# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='File list utility with features from ls(1), find(1), stat(1), and du(1)'
pkgname=lr
pkgver=1.5.1
pkgrel=1
url=https://github.com/leahneukirchen/lr
arch=(x86_64)
depends=(glibc)
license=(custom:MIT)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7016c65dcac1b92d28b8397294063b3684602cec2d7defb90ad5b280931d08755108cd8b96e2adb8f186a3d7627ccde24413a5f38259ba44eb8b1e70a75c9c68')

build () {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr
}

package () {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
