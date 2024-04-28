# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TOP
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('af6712369d58630bdcc2b05d7dc06b52')
b2sums=('1504b65c16e25b50d4bacea22c59b13be1099978e85fcce63044dbdf45395db0584625d28d1854475953e87312d56f185c9222e9f706793710b6ed135ced4e01')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
