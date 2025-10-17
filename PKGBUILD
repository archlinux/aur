# Maintainer: Niklas Schönberg <niklas@foonly.dev>

pkgname=foondot
pkgver=0.7.0
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
sha256sums=('ee6dcf161f7ef7a187d0224fddcdf76a4d2071c365a98c7c37f14721a67bc2df')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go build -v -ldflags="-X main.version=${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
