# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rnits
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Normalization and Inference of Time Series data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-affy
  r-biobase
  r-ggplot2
  r-impute
  r-limma
  r-qvalue
  r-reshape2
)
optdepends=(
  r-biocstyle
  r-geoquery
  r-knitr
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a2800d06ff629ccdf2f4eaaca7f9068e')
b2sums=('c5371363700593af27801b97fda26c0867edf0d0e89706de06127336ddf00fd11f78fc6c24434bbbea48e32e6e0b99a142bb904412d8ea211a0550e9faca05d4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
