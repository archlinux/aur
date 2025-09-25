# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alakazam
_pkgver=1.4.0
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
md5sums=('8db7781b0b4159804d0a78e895560782')
b2sums=('b5b3c827c92decbf43a44762f359376ab98c64caeaeda84be4329e15c03648a0ac53c23718d4ac9f80adffd5a6b39a474f975f6f329c3461fd2be5f1824ba8cf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
