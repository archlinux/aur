# Maintainer: Acuvity

pkgname=minibridge-git
pkgdesc="Make your MCP servers secure and production ready"
url="https://github.com/acuvity/minibridge"
pkgver=v0.4.0.r5.g2c0cf86
pkgrel=1
license=(Apache2)
arch=(any)
makedepends=(go)
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')
provides=("minibridge")
conflicts=("minibridge")

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}" || exit
	make build
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/minibridge" "${pkgdir}/usr/bin/minibridge"
}
