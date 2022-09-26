# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=Mosca
pkgname="${_pkgname,,}"
pkgver=0.96
_pkgver="${pkgver//.}"
pkgrel=1
pkgdesc="Manual search tool to find bugs like a grep unix command"
arch=('any')
url="https://github.com/CoolerVoid/Mosca/"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CoolerVoid/Mosca/archive/refs/tags/${_pkgname}_v${_pkgver}.tar.gz")
sha256sums=('f8df5d33bb08e711826dfa16bd3405da0422dc5dade47d27ed5c1e21019522c7')

build() {
	cd "${_pkgname}-${_pkgname}_v${_pkgver}"
	make
}

package() {
	cd "${_pkgname}-${_pkgname}_v${_pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
	install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}
