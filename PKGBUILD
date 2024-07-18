# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nls2
_pkgver=0.3-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Non-Linear Regression with Brute Force"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-proto
)
optdepends=(
  r-cpoptim
  r-lhs
  r-nlstools
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d94ead1f3339af50cfef6dc7e034b896')
b2sums=('3fdca5e5014b56937b62f23a508dfc8d1c8e94202698b90d4e12404a0f8834edce7009d3c905d5b722bb3863537edde6bf45fa2458d23f1251b73c9b27051a0e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
