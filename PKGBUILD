# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rifi
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'rifi' analyses data from rifampicin time series created by microarray or RNAseq"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('5d070b26ca40e04e4e3f9851853caa48')
sha256sums=('82ea553367f6850b21ce41e9e1e791f269f1ed5c782a1ded795a69633ee71634')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
