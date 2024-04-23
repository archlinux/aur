# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=randtests
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Testing Randomness in R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1ce6d8ab51563e0776e7d055367d4f15')
b2sums=('9fd6a9b31073ee3892a2a20e9103404fcc6ec1918d614e7bd2e97606a9b76d6741f47cea4a07a77d47192ef05e1c9833bc698f320dfc53e3900d7087a6050053')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
