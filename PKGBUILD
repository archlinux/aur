# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rifi
_pkgver=1.10.0
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
md5sums=('9c1fda271448f428b30150b5c48f8607')
b2sums=('6080ed0761b9a81b20c8e431afa3d087d1253e8bca1c7d9f1f48031ceb1d013d67babac004bc94a4f4f0c0af8fc947d3cf5059302d652f1be98dd5f80dd825b4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
