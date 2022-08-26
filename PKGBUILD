# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=Mosca
pkgname="${_pkgname,,}"
pkgver=0.94
_pkgver="${pkgver//.}"
pkgrel=1
pkgdesc="Manual search tool to find bugs like a grep unix command"
arch=('any')
url="https://github.com/CoolerVoid/Mosca/"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CoolerVoid/Mosca/archive/refs/tags/${pkgname}_v${_pkgver}.tar.gz")
sha256sums=('23a3c1e758348fddbd441fc9284dea9f1729e7179445bac3776c8159774eec08')

build() {
	cd "${_pkgname}-${pkgname}_v${_pkgver}"
  make
}

package() {
	cd "${_pkgname}-${pkgname}_v${_pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}
