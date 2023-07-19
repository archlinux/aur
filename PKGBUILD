# system requirements: GNU make, C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowCore
_pkgver=2.12.2
pkgname=r-${_pkgname,,}
pkgver=2.12.2
pkgrel=1
pkgdesc='flowCore: Basic structures for flow cytometry data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  gcc
  make
  r
  r-bh
  r-biobase
  r-biocgenerics
  r-cpp11
  r-cytolib
  r-matrixstats
  r-rcpp
  r-rprotobuflib
  r-s4vectors
)
optdepends=(
  r-flowstats
  r-flowviz
  r-flowworkspace
  r-flowworkspacedata
  r-ggcyto
  r-gridextra
  r-knitr
  r-opencyto
  r-rgraphviz
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1064a2941dbca4a25ff129ca8d62c9341b545aa070d6221987b2edeac3d57dfc')
options=(!lto !buildflags staticlibs)
build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
