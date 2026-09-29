# Maintainer: Niklas Schönberg <niklas@foonly.dev>

pkgname=foondot
pkgver=1.0.0
pkgrel=1
pkgdesc="A very simple dotfile sync utility written in Go."
url="https://github.com/foonly/${pkgname}"
license=("GPL-2.0-or-later")
arch=("x86_64")
provides=("foondot")
conflicts=("foondot")
makedepends=("go")
optdepends=("git: for the sync command")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=(!debug !lto)
sha256sums=('52d7fd72f3a78d1ba66e762e053c0f4ef8606d38aa81e05ee6e3cd70257e422b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go build -v -ldflags="-X main.version=${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
