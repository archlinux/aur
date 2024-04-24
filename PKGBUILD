# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rTensor
_pkgver=1.4.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Tools for Tensor Analysis and Decomposition"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ef511906da889a60037086dccd717054')
b2sums=('abf98c9cbc81c523597c20717ee0fa695a8c074be7c6c10e656a19e3fe5e5ea112e8c5faed80d766852cd7fb8469d489d754b182734a7ba635615fbf8c95a9b4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
