# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=h5vc
_pkgver=2.40.0
pkgname=r-${_pkgname,,}
pkgver=2.40.0
pkgrel=1
pkgdesc='Managing alignment tallies using a hdf5 backend'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-batchjobs
  r-biocparallel
  r-biostrings
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-h5vcdata
  r-iranges
  r-reshape
  r-rhdf5
  r-rhtslib
  r-rsamtools
  r-s4vectors
  make
)
optdepends=(
  r-biocgenerics
  r-biomart
  r-bsgenome.hsapiens.ncbi.grch38
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-locfit
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('499e723c4881332f3f4de127815d20a865ddcf50155f42efa849246023466798')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
