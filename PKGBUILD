# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatzie
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Identification of enriched motif pairs from chromatin interaction data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-bsgenome
  r-genomeinfodb
  r-genomicfeatures
  r-genomicinteractions
  r-genomicranges
  r-ggplot2
  r-iranges
  r-matrixgenerics
  r-matrixstats
  r-motifmatchr
  r-s4vectors
  r-summarizedexperiment
  r-tfbstools
)
optdepends=(
  r-biocmanager
  r-biostrings
  r-knitr
  r-pheatmap
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
  r-txdb.mmusculus.ucsc.mm9.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0b9fa510ddd71ddddf88219ed3a6a6eb1255a075caa792276561b283e31e31ca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
