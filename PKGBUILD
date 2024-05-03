# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scmeth
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Functions to conduct quality control analysis in methylation data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationhub
  r-annotatr
  r-biostrings
  r-bsgenome
  r-bsseq
  r-delayedarray
  r-dt
  r-genomeinfodb
  r-genomicranges
  r-hdf5array
  r-knitr
  r-reshape2
  r-rmarkdown
  r-summarizedexperiment
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-bsgenome.hsapiens.ncbi.grch38
  r-bsgenome.mmusculus.ucsc.mm10
  r-ggplot2
  r-ggthemes
  r-org.hs.eg.db
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e8e9e9db628dfb94e2bffe1ac3831bca7dd56a944d251ec340045a0a96e13cfb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
