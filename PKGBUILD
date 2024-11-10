# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TOP
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="TOP Constructs Transferable Model Across Gene Expression Platforms"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-assertthat
  r-caret
  r-classifyr
  r-directpa
  r-doparallel
  r-dplyr
  r-ggnewscale
  r-ggplot2
  r-ggraph
  r-ggrepel
  r-ggthemes
  r-glmnet
  r-hmisc
  r-igraph
  r-latex2exp
  r-limma
  r-magrittr
  r-plotly
  r-proc
  r-purrr
  r-reshape2
  r-statmod
  r-stringr
  r-tibble
  r-tidygraph
  r-tidyr
)
optdepends=(
  r-biobase
  r-biocstyle
  r-curatedovariandata
  r-ggbeeswarm
  r-ggsci
  r-knitr
  r-rmarkdown
  r-survminer
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('637187784f8b187f173cd3e6b9fab5aa')
b2sums=('0e2f87dfe6d2acaf85864a8746f819c4bc6bde411902e517be8f096e43cb834f768ae0de4aa6937f3d24486397f18ee4fce9be8cdf1af916ff4fd34b59f96b4f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
