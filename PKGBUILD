# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ATACseqTFEA
_pkgver=1.14.0
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
  r-seqinfo
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
md5sums=('043d9e4b57e436f4cc47587f6cd758ae')
b2sums=('af35d1ef1f589c0c700da7e08f4abff0ff69e81560af31c8c1136d1a4ba264450c8643a0d7f31fef20513cae8180bed144cfe5fca0410ba47f24cbdec064d0bd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
