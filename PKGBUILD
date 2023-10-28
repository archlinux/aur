# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R3CPET
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='3CPET: Finding Co-factor Complexes in Chia-PET experiment using a Hierarchical Dirichlet Process'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-clvalid
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggbio
  r-ggplot2
  r-hmisc
  r-igraph
  r-iranges
  r-pheatmap
  r-rcpp
  r-rcurl
  r-reshape2
  r-s4vectors
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-biomart
  r-biovizbase
  r-chippeakanno
  r-knitr
  r-org.hs.eg.db
  r-shiny
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('655a4af4130e8b585f1a9f8e12ce42660f1ffcef4a2642f394da55c92b67e7df')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
