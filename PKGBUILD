# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alakazam
_pkgver=1.4.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Immunoglobulin Clonal Lineage and Diversity Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-airr
  r-ape
  r-biostrings
  r-dplyr
  r-genomicalignments
  r-ggplot2
  r-igraph
  r-iranges
  r-progress
  r-rcpp
  r-readr
  r-rlang
  r-scales
  r-seqinr
  r-stringi
  r-tibble
  r-tidyr
)
optdepends=(
  r-cigarillo
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('54943e0d3ea71d7a12293e10f2e6fd5b')
b2sums=('3065f51981ca69f31918b1a7ea2840c8d6d95f65045b743c10296e252e26d208bb7522428d2cba4ac6e5061b259b6e5b5fec995214e432764e6e225747590b01')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
