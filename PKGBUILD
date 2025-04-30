# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sctransform
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=0.4.2
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
sha256sums=('56180aebc7f91345e63210df76541681d3673a59d1a388523dc7ba69886ba0d0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
