# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rifi
_pkgver=1.8.0
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
md5sums=('ca63902fc1f80205f1c717d77688fec7')
b2sums=('1d5e843ab7adb9f5b188727d9e4d6dfc722452a2455d9dc2c89d941544cfce0b1d246f0433c5eb1cd80790c2deb8a00843bd430334c21ffc6caeffe607fc7ee9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
