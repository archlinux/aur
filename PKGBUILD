# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstatsSampleSize
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Simulation tool for optimal design of high-dimensional MS-based proteomics experiment"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-caret
  r-ggplot2
  r-gridextra
  r-msstats
  r-reshape2
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d0e79aa072b3fd5a7c5aa71e95a9462c')
b2sums=('4a4b45ae14eee2203729c323a97c18fecea82ef567dabc855bfdf752c8f6147f34e126b4d9fba455f20128c3157a7b9b98c6ca5dceabd635245342ed13b63993')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
