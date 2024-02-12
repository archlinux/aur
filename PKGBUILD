# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GRridge
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Better prediction by use of co-data: Adaptive group-regularized ridge regression"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-glmnet
  r-graph
  r-iso
  r-mvtnorm
  r-penalized
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5c7da0baf7039c0cf766a9b0f904c1dd')
b2sums=('f9c08f51d87b9102f3295959b3da553780c3b4078ce07b2653dd856314f5cbe2eaaf1dda109f00fcab0bcd55172e4180c4fe7ef773a34ee896db6df7dad65dc6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
