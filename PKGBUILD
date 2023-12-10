# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GRaNIE
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="GRaNIE: Reconstruction cell type specific gene regulatory networks including enhancers using chromatin accessibility and RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('681f6cd397a1861871fedcbc84b69e5cfe86db7bb5493bd69d9eb1e2b43d37ed')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
