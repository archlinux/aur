# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=Mosca
pkgname="${_pkgname,,}"
pkgver=0.95
_pkgver="${pkgver//.}"
pkgrel=1
pkgdesc="Manual search tool to find bugs like a grep unix command"
arch=('any')
url="https://github.com/CoolerVoid/Mosca/"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CoolerVoid/Mosca/archive/refs/tags/${pkgname^}_v${pkgver}.tar.gz")
sha256sums=('921b96bb2e7486ef7f3c5fc232a7772119ede53bd9b044cf59c26d6ae9ad1d14')

build() {
	cd "${_pkgname}-${_pkgname}_v${pkgver}"
  make
}

package() {
	cd "${_pkgname}-${_pkgname}_v${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}
