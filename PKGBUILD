# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cfdnakit
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fragmen-length analysis package from high-throughput sequencing of cell-free DNA (cfDNA)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-magrittr
  r-pscbs
  r-qdnaseq
  r-rlang
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-roxygen2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b9b2a138a119bec5fc65f6a7475520c4')
b2sums=('75731ad8a9492b348489cd06a205eeef4319394530dab6a43c939c9e34c03a76b84e582067637f095b29f5689a38ccacc7c2c78dbfdb971a37b63de02442105e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
