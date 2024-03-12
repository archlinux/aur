# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=cocor
_pkgver=1.1-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Comparing Correlations"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2e5d0b5a82bd9db4d0d1b33201c0f481')
b2sums=('c8e9aaa012a2f61f22b96bf2809fa060276788e392ed82ccddaa2031e1bc5f53b92b0253df56a7b4d2bc861fc663839bd9c1f015e7c86a93248e2fb991a61857')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
