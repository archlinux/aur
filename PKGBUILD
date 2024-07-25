# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SGCP
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A semi-supervised pipeline for gene clustering using self-training approach in gene co-expression networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
  r-biocstyle
  r-devtools
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c511f41bf8d2edd51cfc81b73c3d067c')
b2sums=('99529be47906c84b09c7f13545faf3b54ec937aff279357cce77f017e3b01d36b5a8f5c52e552b634ccba263fe5545d52e5262b5e937067b4af65a0953d13780')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
