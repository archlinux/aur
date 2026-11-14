# Maintainer: Niklas Schönberg <niklas@foonly.dev>

pkgname=foondot
pkgver=1.0.2
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
sha256sums=('bdccc2b270a94c029040161ad6bf8afa90da3a258f0c7a873c00daae84b29a70')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go build -v -ldflags="-X main.version=${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
