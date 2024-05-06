# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GRaNIE
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Reconstruction cell type specific gene regulatory networks including enhancers using single-cell or bulk chromatin accessibility and RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biomart
  r-biostrings
  r-checkmate
  r-circlize
  r-colorspace
  r-complexheatmap
  r-data.table
  r-deseq2
  r-dplyr
  r-ensembldb
  r-forcats
  r-futile.logger
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-igraph
  r-limma
  r-magrittr
  r-matrixstats
  r-patchwork
  r-progress
  r-rcolorbrewer
  r-readr
  r-reshape2
  r-rlang
  r-s4vectors
  r-scales
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
  r-topgo
  r-viridis
)
optdepends=(
  r-biocfilecache
  r-biocparallel
  r-biocstyle
  r-bsgenome.dmelanogaster.ucsc.dm6
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmulatta.ucsc.rhemac10
  r-bsgenome.mmusculus.ucsc.mm10
  r-bsgenome.mmusculus.ucsc.mm9
  r-bsgenome.rnorvegicus.ucsc.rn6
  r-bsgenome.rnorvegicus.ucsc.rn7
  r-chipseeker
  r-clusterprofiler
  r-csaw
  r-dose
  r-edaseq
  r-ihw
  r-jaspar2022
  r-jaspar2024
  r-knitr
  r-ldlinkr
  r-motifmatchr
  r-org.dm.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.mmu.eg.db
  r-org.rn.eg.db
  r-purrr
  r-rbioapi
  r-reactomepa
  r-testthat
  r-tfbstools
  r-txdb.dmelanogaster.ucsc.dm6.ensgene
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdb.mmulatta.ucsc.rhemac10.refgene
  r-txdb.mmusculus.ucsc.mm10.knowngene
  r-txdb.mmusculus.ucsc.mm9.knowngene
  r-txdb.rnorvegicus.ucsc.rn6.refgene
  r-txdb.rnorvegicus.ucsc.rn7.refgene
  r-variancepartition
  r-wgcna
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('eebd7994ef623c8636b4ea0d6ca91a55')
b2sums=('d29cd13677278725a34d8b32daf75f2d65b47b7738bf453c1c643e43b352509d92cb4bf03219ad0519f83dfc0c5f4a8229dfe20cd028afa5ed1679728f683134')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
