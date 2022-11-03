# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scmeth
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
sha256sums=('8a2c3ee677a23d3eeb962e43794743b83bf107f778f51a9baaa84aab9ec10fbf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
