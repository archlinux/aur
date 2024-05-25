# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mrfDepth
_pkgver=1.0.17
pkgname=r-${_pkgname,,}
pkgver=1.0.17
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
sha256sums=('ac024e4bda58339e68d3060c6536c072a079e8f2948b12af3aad0d9fe5bf6716')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
