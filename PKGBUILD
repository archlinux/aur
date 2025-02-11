# system requirements: little-endian platform
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fstcore
_pkgver=0.10.0
pkgname=r-${_pkgname,,}
pkgver=0.10.0
pkgrel=1
pkgdesc="R Bindings to the 'Fstlib' Library"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MPL2')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-lintr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1e9e976d295dccda563a7d100665cb9d36d1403d3c37ce835f681b81f7a8d9cc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
