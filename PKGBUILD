# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GRaNIE
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Reconstruction cell type specific gene regulatory networks including enhancers using chromatin accessibility and RNA-seq data"
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
md5sums=('d9db703063398ccd263ce6b54def9266')
b2sums=('79192e9cb4153a1ebf23e76daa0c9629bcdf36545108587914bf02e624cdd00033ccc7ec998bcdef229a8a9ea7bab3bc7d9806329350f6712d684429016d08cb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
