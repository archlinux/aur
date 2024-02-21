# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=aTSA
_pkgver=3.1.2.1
pkgname=r-${_pkgname,,}
pkgver=3.1.2.1
pkgrel=1
pkgdesc='Alternative Time Series Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e9236b10f073cf8f8730302f88f0ef6ca95ba84be48b0e601ac5de6e3baf3cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
