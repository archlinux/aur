# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsvd
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Randomized Singular Value Decomposition"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9fbe5f89c66c1fc7a6e381c0dfe912ec')
b2sums=('617c9028f5bd2e6552c3e59352ac198df9987050ab1d2991bcba8c19c63f7bda06539ca4f052ccfeeeef6eb46c583101fb047af2982cb397fed5bc9117b3749a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
