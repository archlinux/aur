# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CBNplot
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="plot bayesian network inferred from gene expression data based on enrichment analysis results"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('0717efc5c7c4f3b2b957528ff99c8dea')
sha256sums=('5371832bf68dd55e7624f29af29e90c64659a673f984d3f242290abfbe9486b4')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
