# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=evaluomeR
_pkgver=1.28.0
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
md5sums=('92c9d2efc5fcb57e27eeeb63dc34e3d4')
b2sums=('6986c05edfb8b175bc9e2464ab9bda867083814c5e5b80cacaf5944cb5ab7805e6e0760e3b51cb674335b4accced59727948cf6d012f17191e7e29a6dc0da45b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
