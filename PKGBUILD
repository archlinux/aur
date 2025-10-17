# Maintainer: Niklas Schönberg <niklas@foonly.dev>

pkgname=foondot
pkgver=0.6.0
pkgrel=1
pkgdesc="A very simple dotfile sync utility written i Go."
url="https://github.com/foonly/${pkgname}"
license=("GPL-2.0-or-later")
arch=("x86_64")
provides=("foondot")
conflicts=("foondot")
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=(!debug !lto)
sha256sums=('978a9f427ad452dedca15f939cba6663ef10dee5da44e0fa4dfdadbdd995695b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go build -v -ldflags="-X main.version=${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
