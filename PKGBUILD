# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mrfDepth
_pkgver=1.0.16
pkgname=r-${_pkgname,,}
pkgver=1.0.16
pkgrel=1
pkgdesc='Depth Measures in Multivariate, Regression and Functional Settings'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-geometry
  r-ggplot2
  r-matrixstats
  r-rcpp
  r-rcpparmadillo
  r-rcppeigen
  r-reshape2
)
optdepends=(
  r-robustbase
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('120e5d6b6dbc32b3ce6e78d5e7f61307025fcc2d40c14f2c01f39f926c44b8f7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
