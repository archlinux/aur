# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rifi
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'rifi' analyses data from rifampicin time series created by microarray or RNAseq"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-car
  r-cowplot
  r-domc
  r-dplyr
  r-egg
  r-foreach
  r-ggplot2
  r-nls2
  r-reshape2
  r-rlang
  r-rtracklayer
  r-s4vectors
  r-scales
  r-stringr
  r-summarizedexperiment
  r-tibble
)
optdepends=(
  r-biocstyle
  r-desctools
  r-devtools
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ffdd4b600eb4e1ac15f31cafda0ed571')
b2sums=('a995d9fdac92b0f99fd7e8ae3c865d17fb7717cd1f9618a76b722af231307c2e5b346e4a600c4cea9f40ba2e3ebab300ddef49876406a0e9bbfb92b86c2d5408')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
