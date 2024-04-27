# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rifi
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('5d070b26ca40e04e4e3f9851853caa48')
b2sums=('37f255dba78ae93a8ef3ed40f3ae19baaccc8277b4bd2088c3d29f5a722fd5ad3d323f484aebfcd1172d020cc71feed030d59dd276ff832b37b3c0f5dccddae9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
