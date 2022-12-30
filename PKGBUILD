# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=Mosca
pkgname="${_pkgname,,}"
pkgver=0.98
_pkgver="${pkgver//.}"
pkgrel=1
pkgdesc="Manual search tool to find bugs like a grep unix command"
arch=('any')
url="https://github.com/CoolerVoid/Mosca/"
license=('GPL3')
depends=('pcre')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CoolerVoid/Mosca/archive/refs/tags/${pkgname}_v${_pkgver}.tar.gz")
sha256sums=('19b73cdbe2c98b6635396933f5763113e4a6935347896ac404170ef66b96125a')

build() {
	cd "${_pkgname}-${pkgname}_v${_pkgver}"
	make
}

package() {
	cd "${_pkgname}-${pkgname}_v${_pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
	install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}
