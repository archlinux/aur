# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alakazam
_pkgver=1.4.1
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
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f50233c3437ef233a287563f472952fe')
b2sums=('ff1ed7ad3c46c3a13758b3cfa0bdff62120f3e8bfcf243c262726aca862adf818a7f7df5f885c70e8c3547278446c1f9ecf00c27c0fcfcbcfcca41e891483500')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
