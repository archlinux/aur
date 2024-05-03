# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=esATAC
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='An Easy-to-use Systematic pipeline for ATACseq data analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  gcc
  r
  r-annotationdbi
  r-biocgenerics
  r-biocmanager
  r-biostrings
  r-bsgenome
  r-chipseeker
  r-clusterprofiler
  r-corrplot
  r-digest
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-igraph
  r-iranges
  r-jaspar2018
  r-knitr
  r-magrittr
  r-motifmatchr
  r-pipeframe
  r-r.utils
  r-rbowtie2
  r-rcpp
  r-rjava
  r-rmarkdown
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-shortread
  r-tfbstools
  r-venndiagram
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-org.hs.eg.db
  r-prettydoc
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-webshot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fa20cb9c726ccfe0e95433f85c3486e7d929c05e267096c4847f15f64fa1d13d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
