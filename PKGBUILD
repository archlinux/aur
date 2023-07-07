# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mrfDepth
_pkgver=1.0.14
pkgname=r-${_pkgname,,}
pkgver=1.0.14
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
sha256sums=('87b21e553cee59b3877ff6c672f2bf897467ac755207d4427ee9c99745b006ca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
