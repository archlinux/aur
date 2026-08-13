# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TOP
_pkgver=1.12.0
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
md5sums=('5fbc705683b64e9efdbe72cf0a791a30')
b2sums=('9978faad1727a6ae56719b3bf36d9002f3e5aec4e7bdfcbb3377c86c44d805636dab43195846f5a9e02f2531d4d2dec843313e6bea8cbb41b4f2c9b78663fe4b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
