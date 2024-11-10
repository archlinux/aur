# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ATACseqTFEA
_pkgver=1.8.0
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
md5sums=('ddd2599383dc600b5a673bbf4b6b9ba5')
b2sums=('e73b05a150f98a40ca5c66654f994c899db78d3d0e7908a0ba46d3af31af95658e16bd9e30fbed8b6baaf75b45c1c8d5aa63413bac4855cedaf65f6b40e72e62')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
