# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=OpenMRac-data
_pkgname2=${_pkgname%-*}
pkgname="${_pkgname,,}"
pkgver=1.1
pkgrel=2
pkgdesc='Data for OpenMRac'
arch=('x86_64' 'aarch64')
url="https://github.com/Franticware/${_pkgname}"
license=('CC0')
makedepends=('sox')
depends=('gsm')
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4e47ea2c9f2090af5e0085a67b0b360e449d531a3539dd4e7313449d79066356')

build() {
  cd "${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 "${_pkgname2,,}.dat" "${pkgdir}/usr/share/${_pkgname2,,}/${_pkgname2,,}.dat"
}
