# Maintainer: Niklas Schönberg <niklas@foonly.dev>

pkgname=foondot
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple dotfile sync utility written in Go."
url="https://github.com/foonly/${pkgname}"
license=("GPL-2.0-or-later")
arch=("x86_64")
provides=("foondot")
conflicts=("foondot")
makedepends=("go")
optdepends=("git: for the sync command")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=(!debug !lto)
sha256sums=('039980e2e665a904dd5db96bdbe97627d3376995a202d2027976e700d88ef5f6')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go build -v -ldflags="-X main.version=${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
