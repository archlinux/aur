# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MAST
_pkgver=1.24.1
pkgname=r-${_pkgname,,}
pkgver=1.24.1
pkgrel=1
pkgdesc='Model-based Analysis of Single Cell Transcriptomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-biobase
  r-biocgenerics
  r-data.table
  r-ggplot2
  r-plyr
  r-progress
  r-reshape2
  r-s4vectors
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-blme
  r-car
  r-delayedarray
  r-dplyr
  r-gdata
  r-ggally
  r-gseabase
  r-hdf5array
  r-knitr
  r-lattice
  r-limma
  r-lme4
  r-matrix
  r-nmf
  r-numderiv
  r-rcolorbrewer
  r-rmarkdown
  r-roxygen2
  r-rsvd
  r-scater
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-zinbwave
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c5c04d96388fb0abb0effce149dce6fdffc4e668c6cf80484f052dbb146114b0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
