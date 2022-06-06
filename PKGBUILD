# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=parallelDist
_pkgver=0.2.6
pkgname=r-${_pkgname,,}
pkgver=0.2.6
pkgrel=4
pkgdesc='Parallel Distance Matrix Computation using Multiple Threads'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcpparmadillo
  r-rcppparallel
  gcc
)
optdepends=(
  r-dtw
  r-ggplot2
  r-proxy
  r-rcpparmadillo
  r-rcppxptrutils
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('30c6b3b85cf78c04a7dcd17ea7ed64356971f6ce48d15794078a18c53b249e06')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
