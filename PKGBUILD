# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alakazam
_pkgver=1.3.0
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
md5sums=('aef6659ef46836fe6b03da34625261b2')
b2sums=('d5de753de4046f903f0cefed9963de44392dd22ff56f5cd7a84657891e1abc1f779a294bb13348bee28bfccc4aacf5d4666a14be8d41ac13210667f62b24e2ac')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
