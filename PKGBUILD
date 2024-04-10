# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.sets
_pkgver=0.0-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Assertions to Check Properties of Sets"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-assertive.base
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('060f193e9ae8c91487cf3478720d920c')
b2sums=('02c2371971155a2607283f9a5f960a8fa21f8b787f4555b33a24d9566e29106532c779920a22affae18d22a6095af045a1b33b9d4183cc314c74f2fa44d1b4c1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
