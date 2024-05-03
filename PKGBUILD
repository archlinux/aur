# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genomation
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Summary, annotation and visualization of genomic data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-bsgenome
  r-data.table
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-gridbase
  r-impute
  r-iranges
  r-matrixstats
  r-plotrix
  r-plyr
  r-rcpp
  r-readr
  r-reshape2
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-seqpattern
)
optdepends=(
  r-biocgenerics
  r-genomationdata
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('440600e76f82572d52e1e3b3036bb1713aebe3ed4b4341f448f81c35a721dead')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
