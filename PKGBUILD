# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggbio
_pkgver=1.49.0
pkgname=r-${_pkgname,,}
pkgver=1.49.0
pkgrel=1
pkgdesc='Visualization tools for genomic data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationfilter
  r-biobase
  r-biocgenerics
  r-biostrings
  r-biovizbase
  r-bsgenome
  r-ensembldb
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggally
  r-ggplot2
  r-gridextra
  r-gtable
  r-hmisc
  r-iranges
  r-organismdbi
  r-reshape2
  r-rlang
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scales
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-ensdb.hsapiens.v75
  r-homo.sapiens
  r-knitr
  r-testthat
  r-tinytex
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.mmusculus.ucsc.mm9.knowngene
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ece8534be4e26e3f607aa972c7ad7efbcc62e16fffc44d0de5b5b9aea628f1d8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
