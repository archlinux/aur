# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CBNplot
_pkgver=1.4.2
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
md5sums=('05cfcb896f00a2a55d06ec1d740f80dc')
b2sums=('3631b5772f4d7b4295ce63168ffabbdf049d6b3c59763c87afaf1362887a3747ff3d8e87fdde73981a46f58f8593b842fad44ae62f03e3f7a193cf4c84f0303a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
