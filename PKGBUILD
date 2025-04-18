# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TOP
_pkgver=1.8.0
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
md5sums=('e7eea3f74f27ddabef17781a4ec84721')
b2sums=('c3394df4ade2123e68b8e0eed8157d3fae3a26fc1494c3d87c96ec8d1008fbe203a36bd146868332057562c827dc744ef1b8566a3e56c69e0cf0fb9b3ded47b4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
