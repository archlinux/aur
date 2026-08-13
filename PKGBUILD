# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rnits
_pkgver=1.46.0
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
md5sums=('e41fafdf03a5511e36f706a6c5031c4a')
b2sums=('b4c68f93a995fe0d440bfa6aae5d9b00952fb912a920999601153e558f1109d66135b668e97e2be0975b6766bc99f35474634bf0a01bc80711f3aa9154da89a8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
