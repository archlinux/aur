# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=netflow2ng
pkgver=0.2.2
pkgrel=1
pkgdesc="NetFlow v9 collector for ntopng"
arch=('x86_64')
url="https://github.com/synfinatic/netflow2ng"
license=('MIT')
makedepends=('go' 'protoc-gen-go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('009be49b8db23f39c21bd216c8ee1ddb317f6257478d0e9a5948aa0bd6229e6a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/dist/netflow2ng-0.2.2" "${pkgdir}/usr/bin/netflow2ng"
}
