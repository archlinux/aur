# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=Mosca
pkgname="${_pkgname,,}"
pkgver=0.98
_pkgver="${pkgver//.}"
pkgrel=2
pkgdesc="Manual search tool to find bugs like a grep unix command"
arch=('any')
url="https://sourceforge.net/projects/mosca/"
license=('GPL3')
depends=('pcre')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.zip::https://master.dl.sourceforge.net/project/mosca/Mosca-mosca_v${_pkgver}.zip")
sha256sums=('5098e29ccd40c3d0efbbc380c02a022734091faa5dc085f1d3ff1cbeed7106f6')

build() {
	cd "${_pkgname}-${pkgname}_v${_pkgver}"
	make
}

package() {
	cd "${_pkgname}-${pkgname}_v${_pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
	install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}
