# Maintainer: Niklas Schönberg <niklas@foonly.dev>

pkgname=foondot
pkgver=0.6.1
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
sha256sums=('a7e37090a20a291f9f041a28e04b43f2de04e834845c7cbe11de1d380e7f922b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go build -v -ldflags="-X main.version=${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
