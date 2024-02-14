# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=farms
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Factor Analysis for Robust Microarray Summarization"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.1-or-later')
depends=(
  r-affy
  r-biobase
)
optdepends=(
  r-affydata
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('47741e71448e6a0b2b47309b31572a2d')
b2sums=('1ee08038bc8d2c9e100afede45528f752c9a61bfb9042e685c17473b612f417ce353378dde572c9c186853f4fac26e1a9fe438943393d6cbe952485be6ec6851')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
