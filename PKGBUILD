# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cfdnakit
_pkgver=1.4.0
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
md5sums=('5c2b321346a514f4aa3043afc450fd63')
b2sums=('396553337a234d5ce04765e3632f7d9b81723bf3543ba80fc81111c527574ed343eca233be6dfbfe9ec8588acd30a705fedec47304f5a1fccf8fc1bfc69ec4ec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
