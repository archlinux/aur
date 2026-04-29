# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pathwayPCA
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrative Pathway Analysis with Modern PCA Methodology and Gene Selection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-lars
)
optdepends=(
  r-airway
  r-circlize
  r-knitr
  r-rcurl
  r-reshape2
  r-rmarkdown
  r-summarizedexperiment
  r-survminer
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4893327d174e201838b1949108af4649')
b2sums=('2d3db0c699304a0d02a262dd361f21021f5240e78caa3ee9c13d4adc14bb6ace2b426c950fb24e4f139b26ee1e0844b95776ed8cf7d9af4b90c93599ae3938ba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
