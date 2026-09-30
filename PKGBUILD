# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=precrec
_pkgver=0.24.0
pkgname=r-${_pkgname,,}
pkgver=0.24.0
pkgrel=2
pkgdesc='Calculate Accurate Precision-Recall and ROC (Receiver Operator Characteristics) Curves'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-checkmate
  r-cli
  r-data.table
  r-ggplot2
  r-gridextra
  r-rcpp
  r-rlang
  r-withr
)
optdepends=(
  r-knitr
  r-patchwork
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f5a9e4118cc4b81433e5509ba39efda56121b251f1354b0b70c21e1d88b02074')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
