# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=evaluomeR
_pkgver=1.22.0
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
md5sums=('0e266ceb6584309cbed2a0e4c5808390')
b2sums=('cd9fffd6a8688be554b59f4cfbd3e120348fff1b65ddcb8c01212033760f382a03fba58771930b089ee7a4b4dc7ae7bb4615725479c5a8e272507c9d517ec100')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
