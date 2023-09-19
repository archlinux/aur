# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sctransform
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=0.4.0
pkgrel=1
pkgdesc='Variance Stabilizing Transformations for Single Cell UMI Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  gcc
  r
  r-dplyr
  r-future
  r-future.apply
  r-ggplot2
  r-gridextra
  r-magrittr
  r-matrixstats
  r-rcpp
  r-rcpparmadillo
  r-reshape2
  r-rlang
)
optdepends=(
  r-glmgampoi
  r-irlba
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9aef10c196a9578e0d7a8e244c55cf28eb0685947d9df9e2d7790c2b99c6b4b3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
