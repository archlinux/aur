# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=minibridge
pkgdesc="Make your MCP servers secure and production ready"
url="https://github.com/acuvity/minibridge"
pkgver=0.5.0
pkgrel=1
license=(Apache2)
arch=(any)
makedepends=(go)
source=("https://github.com/acuvity/minibridge/archive/refs/tags/v${pkgver}.zip")
sha1sums=('dfcedb7de74a6cda4a6e50bddf593afa7c235388')
provides=("minibridge")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
	make build
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/minibridge" "${pkgdir}/usr/bin/minibridge"
}
