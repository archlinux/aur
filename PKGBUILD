# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=Mosca
_pkgname2="${_pkgname,,}"
pkgname="${_pkgname2}-git"
pkgver=0.94
_pkgver="${pkgver//.}"
pkgrel=1
pkgdesc="Manual search tool to find bugs like a grep unix command"
arch=('any')
url="https://github.com/CoolerVoid/Mosca/"
license=('GPL3')
makedepends=("git")
provides=("${_pkgname2}")
conflicts=("${_pkgname2}")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

build() {
	cd "${_pkgname}"
  make
}

package() {
	cd "${_pkgname}"
  install -Dm755 "${_pkgname2}" "${pkgdir}"/usr/bin/"${_pkgname2}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${_pkgname2}"/README.md
}
