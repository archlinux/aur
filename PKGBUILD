# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=octad
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Open Cancer TherApeutic Discovery (OCTAD)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biobase
  r-data.table
  r-deseq2
  r-dplyr
  r-edaseq
  r-edger
  r-experimenthub
  r-foreach
  r-ggplot2
  r-gsva
  r-htmlwidgets
  r-httr
  r-limma
  r-magrittr
  r-octad.db
  r-plotly
  r-reshape2
  r-rfast
  r-rhdf5
  r-ruvseq
  r-s4vectors
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('65dcd54e4646d61afcfb9afc90108ba4')
b2sums=('966ee82b55a73166626ea1c7b65f75b0f5c9769fa5a005a93bdc5e1a87f97d566a963b851bd1e77656981c6ffb1124608f688dd45db7f024f535a8d6b33b1a87')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
