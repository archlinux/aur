# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TOP
_pkgver=1.4.0
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
md5sums=('3f82d34d4cc5baa5f0db6c423a1c7f2b')
b2sums=('4520f1eaf9b50009f0552e6142e73c8e35c86fb9717b4b0afff9c64aa537a93bbd5030c662379fe22f4112d1d9b7161a7f41227803b333f46c23531bf846635d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
