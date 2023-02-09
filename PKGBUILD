# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=precrec
_pkgver=0.14.1
pkgname=r-${_pkgname,,}
pkgver=0.14.1
pkgrel=3
pkgdesc='Calculate Accurate Precision-Recall and ROC (Receiver Operator Characteristics) Curves'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
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
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a81be3001ad25ff8d2dfff29390a08008875e0b4e4a8e398e37f8d4b18c7fe12')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
