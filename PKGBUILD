# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ZygosityPredictor
_pkgver=1.4.0
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
md5sums=('111f4c15904c82969a17f82714a9b141')
b2sums=('fbeda19a1d8ce1dd01f0e2aab243b4eb0e86370b213f941a94363ca658b2c4fb5e540c02b0204da6a5db0782019e20d6482260b251235671a04eb07c3091bbd1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
