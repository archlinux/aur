# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=swfdr
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimation of the science-wise false discovery rate and the false discovery rate conditional on covariates"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-ggplot2
  r-knitr
  r-qvalue
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('df5515b6f5248314e0bf2b3d9796a675')
b2sums=('ee48d0951279f735082b1dcef84180ba9edc504fd9cec768b480e26a062efcec49f03991119f94b4f440a00f40a45cb735122259ba66ea5ffbf1f2468d66affb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
