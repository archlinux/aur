# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CBNplot
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
  r-oaqc
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
  r-deseq2
  r-geoquery
  r-knitr
  r-reactomepa
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e87c0c410d247fa34a6ab9e9d3863976')
b2sums=('9b20898c1e9feac5e247388c0346bb5deacdcdcb6ee9d97629a2e705be6f0201c8e0be52d23ab1157e0f4d90387353542cb7cc769de3c715f1b60db8615841dc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
