# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=outliers
_pkgver=0.15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Tests for Outliers"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('be743c547e809a684e2831e82e88206b')
b2sums=('c02012c458adaaa24b12aec32584399a7f4d393c9db4eff99b12eca97e81000e0451c572d4a73ea94864743db0b71b90cb8cfc6be319dbb29545312a463b1bb0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
