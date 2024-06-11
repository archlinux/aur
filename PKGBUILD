# Maintainer: Jonas Costa <contact@jonascosta.ch>
pkgname=filediver
_pkgver='v0.3.3'
pkgver=0.3.3
pkgrel=1
pkgdesc='An unofficial Helldivers 2 game asset extractor'
source=("git+https://github.com/xypwn/filediver.git#tag=${_pkgver}")
arch=('x86_64')
sha512sums=('SKIP')
url='https://github.com/xypwn/filediver'
license=('BSD-3')
makedepends=('go')

build() {
	cd "${srcdir}/${pkgname}"
	GOCACHE="${srcdir}/cache" go build './cmd/filediver-cli'
}

package() {
	install -Dm755 "${pkgname}/${pkgname}-cli" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
