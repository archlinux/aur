# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=octad
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Open Cancer TherApeutic Discovery (OCTAD)"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('7739df34d37584ae3e68a706fb05845da06dfd172925d383b4195e50fe47d505')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
