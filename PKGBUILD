# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SGCP
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SGCP: A semi-supervised pipeline for gene clustering using self-training approach in gene co-expression networks"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-annotate
  r-caret
  r-desctools
  r-dplyr
  r-expm
  r-genefilter
  r-ggplot2
  r-ggridges
  r-go.db
  r-gostats
  r-graph
  r-openxlsx
  r-org.hs.eg.db
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-rgraphviz
  r-rspectra
  r-summarizedexperiment
  r-xtable
)
optdepends=(
  r-biocmanager
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('46986c7dd18ef80a29c389500ed5023b')
sha256sums=('4a6a5196e9cd4bba67b5488740cfacb2c1b8e013762c96a31d679dc3615e80b1')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
