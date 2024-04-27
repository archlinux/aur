# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ATACseqTFEA
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
b2sums=('f7e8f1fc045b52cb60d88601564693c80b6768532ac41ecf1cd18d8987aa64797959a3ed0f51cb8a18af491f48b003bfa9eeeb2cef90edc4fe7bd126880a7af8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
