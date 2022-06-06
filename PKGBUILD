# system requirements: GNU make, C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowWorkspace
_pkgver=4.8.0
pkgname=r-${_pkgname,,}
pkgver=4.8.0
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
sha256sums=('5a6305edbe8da4651bfa8d4d866411b097833d12ad55687a91a133244c8a3e66')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
