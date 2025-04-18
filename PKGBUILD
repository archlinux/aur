# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=evaluomeR
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Evaluation of Bioinformatics Metrics"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-corrplot
  r-dendextend
  r-dplyr
  r-flexmix
  r-fpc
  r-ggdendro
  r-ggplot2
  r-kableextra
  r-matrixstats
  r-mclust
  r-multiassayexperiment
  r-plotrix
  r-prabclus
  r-randomforest
  r-rdpack
  r-reshape2
  r-rskc
  r-sparcl
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-magrittr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4fef7bf5078a46d30a2f8c7374e6a5c6')
b2sums=('fc26e4c47f72a03e47ce4e8396e4ead20856cf9c4dffdb50a5cdb21f0612c94e5fdeb8bb3ee28fd8338255f237c3943ea4635d92dcac235229b72bf4b2689c23')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
