# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIPpeakAnno
_pkgver=3.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Batch annotation of the peaks identified from either ChIP-seq, ChIP-chip experiments, or any experiments that result in large number of genomic interval data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-annotationdbi
  r-biocgenerics
  r-biomart
  r-biostrings
  r-data.table
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
  r-pwalign
  r-rbgl
  r-regioner
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scales
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-universalmotif
  r-venndiagram
)
optdepends=(
  r-annotationhub
  r-biocfilecache
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
  r-ensdb.hsapiens.v86
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
  r-reshape2
  r-rmarkdown
  r-seqinr
  r-testthat
  r-trackviewer
  r-txdb.hsapiens.ucsc.hg18.knowngene
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f8af35069e312bc0429e0e748573071')
b2sums=('257a077943a377acb06baf964cbf7dd7f9837536abce261e79fbaaede9994ee8945f08b959cad9fbfc8b64e27ef9022763652c52e47ab7d9917c9989c7ca9711')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
