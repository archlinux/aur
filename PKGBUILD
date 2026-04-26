# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=jackstraw
_pkgver=1.3.21
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical Inference for Unsupervised Learning"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-bedmatrix
  r-clusterr
  r-corpcor
  r-genio
  r-irlba
  r-rsvd
)
optdepends=(
  r-gcatest
  r-lfa
  r-qvalue
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('72c3c8bf2da67255cfef2cd0ff2b129a')
b2sums=('1a7d4df4a7f083e60187a4510a614e9c03a6ca0b4754932e921b1c6e122864e2d9f55cb209c599f826a6d0258162b09f7b94bd121299757b466435fd1423bdaa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
