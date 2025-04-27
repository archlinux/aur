# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CBNplot
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="plot bayesian network inferred from gene expression data based on enrichment analysis results"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocfilecache
  r-bnlearn
  r-clusterprofiler
  r-depmap
  r-dplyr
  r-enrichplot
  r-experimenthub
  r-ggdist
  r-ggforce
  r-ggplot2
  r-ggraph
  r-graphite
  r-graphlayouts
  r-igraph
  r-magrittr
  r-org.hs.eg.db
  r-patchwork
  r-purrr
  r-pvclust
  r-reshape2
  r-rlang
  r-rmpfr
  r-stringr
  r-tidyr
)
optdepends=(
  r-arules
  r-biocstyle
  r-bnviewer
  r-concaveman
  r-knitr
  r-reactomepa
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9972a5503a5fea3d2438d03db5a1ed5c')
b2sums=('29ed9af5b2e90333d1819c7e500772c5991d0f879ec8e0da629fc2afb924fda9605d31e8816a8e7d72054b1155924e1fdd68d74c12bacd23dce0509833c80bed')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
