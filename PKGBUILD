# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CBNplot
_pkgver=1.6.0
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
md5sums=('1b6998ff402119e2e1bd5d0fde10175a')
b2sums=('40036b51359951e1680d8d15fe09e228a9acef4dfeb4eeeff9fe01d323f3f54a1d59005df8044d6df26bb5be4c59824ed877c1f0c167599f3e258f0ad3444efb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
