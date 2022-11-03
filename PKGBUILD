# system requirements: GNU make, C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowWorkspace
_pkgver=4.10.0
pkgname=r-${_pkgname,,}
pkgver=4.10.0
pkgrel=1
pkgdesc='Infrastructure for representing and interacting with gated and ungated cytometry data sets.'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-aws.s3
  r-aws.signature
  r-bh
  r-biobase
  r-biocgenerics
  r-cytolib
  r-data.table
  r-delayedarray
  r-digest
  r-dplyr
  r-flowcore
  r-ggplot2
  r-graph
  r-latticeextra
  r-matrixstats
  r-ncdfflow
  r-rbgl
  r-rcpp
  r-rcpparmadillo
  r-rcppparallel
  r-rgraphviz
  r-rhdf5lib
  r-rprotobuflib
  r-s4vectors
  r-scales
  r-xml
  make
  gcc
)
optdepends=(
  r-cytoml
  r-flowworkspacedata
  r-ggcyto
  r-knitr
  r-opencyto
  r-parallel
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('832549a21eb1a028a6b56065c9592162069b71b3fb221684616ec7faadbd821f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
