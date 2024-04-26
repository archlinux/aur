# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='File list utility with features from ls(1), find(1), stat(1), and du(1)'
pkgname=lr
pkgver=1.6
pkgrel=1
url=https://github.com/leahneukirchen/lr
arch=(x86_64)
depends=(glibc)
license=(MIT)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a2d4b80f0d62d558a9d724401693044ae6d7549f8c7822374a2e00022c548ee95accd70c9beb98cb345bfeb3f12803667eff73d0f709b1bd581ffa96368cf110')

build () {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr
}

package () {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
