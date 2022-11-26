# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proxyC
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=0.3.3
pkgrel=3
pkgdesc='Computes Proximity in Large Sparse Matrices'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcpparmadillo
  r-rcppparallel
)
optdepends=(
  r-entropy
  r-knitr
  r-proxy
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3e25da94633da0b5c6cdac03f5b6d8205d078f60c5a09073e90a1b6f0930e302')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
