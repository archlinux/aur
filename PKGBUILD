# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIPpeakAnno
_pkgver=3.36.1
pkgname=r-${_pkgname,,}
pkgver=3.36.1
pkgrel=1
pkgdesc='Batch annotation of the peaks identified from either ChIP-seq, ChIP-chip experiments or any experiments resulted in large number of chromosome ranges'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biomart
  r-biostrings
  r-dbi
  r-dplyr
  r-ensembldb
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-graph
  r-interactionset
  r-iranges
  r-keggrest
  r-matrixstats
  r-multtest
  r-rbgl
  r-regioner
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-venndiagram
)
optdepends=(
  r-annotationhub
  r-biocmanager
  r-biocstyle
  r-bsgenome
  r-bsgenome.celegans.ucsc.ce10
  r-bsgenome.drerio.ucsc.danrer7
  r-bsgenome.ecoli.ncbi.20080805
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-delayedarray
  r-ensdb.hsapiens.v75
  r-ensdb.hsapiens.v79
  r-go.db
  r-gplots
  r-idr
  r-knitr
  r-limma
  r-motifstack
  r-org.ce.eg.db
  r-org.hs.eg.db
  r-organismdbi
  r-reactome.db
  r-rmarkdown
  r-seqinr
  r-testthat
  r-trackviewer
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('74a309929f41e74b5d8ea0366b233185ea0d982542fe78ebd8292ab45149afca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
