# Maintainer: Niklas Schönberg <niklas@foonly.dev>

pkgname=foondot
pkgver=0.11.0
pkgrel=1
pkgdesc="A very simple dotfile sync utility written in Go."
url="https://github.com/foonly/${pkgname}"
license=("GPL-2.0-or-later")
arch=("x86_64")
provides=("foondot")
conflicts=("foondot")
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=(!debug !lto)
sha256sums=('bb1488b802488b1da51022b5dc60b241120587018466f411caf2fd03e7f6730c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go build -v -ldflags="-X main.version=${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
