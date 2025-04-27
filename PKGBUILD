# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ZygosityPredictor
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Package for prediction of zygosity for variants/genes in NGS data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-delayedarray
  r-dplyr
  r-genomicalignments
  r-genomicranges
  r-igraph
  r-iranges
  r-knitr
  r-magrittr
  r-purrr
  r-readr
  r-rlang
  r-rsamtools
  r-stringr
  r-tibble
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e7d53cf494892f43f599b07ce5495c2c')
b2sums=('3b7a2dccc8d9ae119f1dcc5367663bc0640ddb280d99e462a165c6137ff68d6a6128051e352f61e9005d1055535cdf0b7812461c1d17732373a7ec6da416c1b0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
