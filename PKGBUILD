# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ATACseqTFEA
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Transcription Factor Enrichment Analysis for ATAC-seq"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  r-dplyr
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-iranges
  r-limma
  r-motifmatchr
  r-pracma
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-tfbstools
)
optdepends=(
  r-atacseqqc
  r-biocstyle
  r-bsgenome.drerio.ucsc.danrer10
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ae46bc71037149e2387785f8da442d42')
b2sums=('17adacd20fe24c68add2823e19a771060309da7f2605b4256617f1daa78341525320d01a4d41b709ebfe4af86571b3702a82fd72567ed09ba38d8030b7394faf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
