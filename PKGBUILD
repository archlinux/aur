# Maintainer: Niklas Schönberg <niklas@foonly.dev>

pkgname=foondot
pkgver=0.4.1
pkgrel=1
pkgdesc="A very simple dotfile sync utility written i Go."
url="https://github.com/foonly/${pkgname}"
license=("GPL-2.0-or-later")
arch=("x86_64")
provides=("foondot")
conflicts=("foondot")
makedepends=('go' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=(!debug !lto)
sha256sums=('332dba4edec277fc01dd0de777c7721f859827eae344e395280c0744f191516a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make foondot
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
