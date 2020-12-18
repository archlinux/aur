# Maintainer: Mattia Biondi <mattia biondi1 at gmail dot com>

pkgname=deber
pkgver=1.1.0
pkgrel=1
pkgdesc="Debian packaging with Docker"
arch=('x86_64')
url="https://github.com/dawidd6/deber"
license=("MIT")
depends=('docker')
makedepends=('go')
provides=(${pkgname})
conflicts=(${pkgname})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b62e76e53773b5f978f00a157ed87fda2e4179e33461c7cc4082d7d7a51e9c7f')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	go build -buildmode=pie
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


