# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocNeighbors
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=1
pkgdesc='Nearest Neighbor Detection for Bioconductor Packages'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-rcpp
  r-rcpphnsw
  r-s4vectors
  r-assorthead
)
makedepends=(
  gcc
)
optdepends=(
  r-biocstyle
  r-fnn
  r-knitr
  r-rcppannoy
  r-rcpphnsw
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3c5a6b91c7318702e51d3defc47591eee0a3f6babfc4c91a4b28f953e0a2d605')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
