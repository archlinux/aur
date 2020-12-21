# Maintainer: Mattia Biondi <mattia biondi1 at gmail dot com>

pkgname=deber
pkgver=1.1.1
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
sha256sums=('572138f94ef1ae2391a58985ccd450573aa0011395ac4414c88bd5ff22921ad3')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	go build -buildmode=pie
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


