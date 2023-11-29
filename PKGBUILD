# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ATACseqTFEA
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Transcription Factor Enrichment Analysis for ATAC-seq"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('30284cc31687d97f23d2a7c023e8561d')
sha256sums=('5c7e8e3079bb9b1aa8b836d3824cd93d26b77fe310eb43f7585d181e1edce2b3')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
