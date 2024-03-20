# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rnits
_pkgver=1.36.0
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
md5sums=('4b767809cee3875eb2f7f991fba83771')
b2sums=('b7a8abeef4ff9f61f1d74afe9fdcb888acbda643ea759252885b20e19bc6f3e4099b6304c47cb7eba774e4c3d520066a7cdf36db3709df373a4a627343fb699e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
