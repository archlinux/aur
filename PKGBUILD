# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nls2
_pkgver=0.3-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Non-Linear Regression with Brute Force"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-proto
)
optdepends=(
  r-lhs
  r-nlstools
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('eee678502a3619729c92e99af2aec30d')
b2sums=('1be6a53774d9fd793e1f78804ef9c2dcef9dd9f2bee23ffa2d4ef0e250283e8457bf3b1f079cfae234f4a07e0e24feab9e2112b28e29224931fb0fdcb8eba852')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
