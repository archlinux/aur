# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3measures
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Performance Measures for 'mlr3'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-checkmate
  r-mlr3misc
  r-prroc
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c126e9474f6e9fa90d187008c1ed2c2e')
b2sums=('7eff9c8fcc60053a2c30c26903b3c661d4e7146f83e17b4c20f8e08358b62de1ffca903ede06fc64d0028d9ca3ac1b0745dbe5989cfc43bb98d01379750e8317')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
