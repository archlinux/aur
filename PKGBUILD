# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pathwayPCA
_pkgver=1.30.0
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
md5sums=('331d718ca55e75e55f74a8820f438ba7')
b2sums=('aaf1eb24264e23fa58f44a1c4e5aac9f85daa37ef843d7187f2c09278e70ebf192e3d0b0dc5aa0c5651f561cad7ef1ce0fa43162595b9962abf757c774c51283')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
