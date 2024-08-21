# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SGCP
_pkgver=1.4.2
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
md5sums=('516651ecbf7bfcae780859fa677c6b88')
b2sums=('686bea5e667e0ae7bf28cdf58453e55e6e2ff27afe705ebcc13da24c0aad1637cba3edff0cce4c7531cb240645c422e9153c096ca6f820d00f2952c7c7acbe63')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
