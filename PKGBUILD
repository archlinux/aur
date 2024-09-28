# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=jackstraw
_pkgver=1.3.17
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
md5sums=('d79f90e86983a1874a49ab228a1c11f8')
b2sums=('9256169d7e93a162db51420f3790df0bb8afbdb7f72feee8602f87f47fdeed9acbbb9f4f67cc1aced7d172961286869cea046814235f843a4a85f3573bb6dcc6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
