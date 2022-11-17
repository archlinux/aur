# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=OpenMRac-data
_pkgname2=${_pkgname%-*}
pkgname="${_pkgname,,}"
pkgver=1.0
pkgrel=2
pkgdesc='Data for OpenMRac'
arch=('x86_64' 'aarch64')
url="https://github.com/Franticware/${_pkgname}"
license=('CC0')
makedepends=('sox')
depends=('gsm')
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('16e2f4c8cb3a499a6738de6d8dc384628297677734761fb571e3cd83b93dc0f3')

build() {
	cd "${_pkgname}-${pkgver}"
	make
}

package() {
	cd "${_pkgname}-${pkgver}"
  install -Dm644 "${_pkgname2,,}.dat" "${pkgdir}/usr/share/${_pkgname2,,}/${_pkgname2,,}.dat"
}
