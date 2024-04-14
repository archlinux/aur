# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stable
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Probability Functions and Generalized Regression Models for Stable Distributions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rmutil
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('16a7ec353ed33075f93b03e8c92a296c')
b2sums=('362ea644461d67ce01cd241b4880d489f85eeead99e1f2b3f9d4a257c9db7bb0ff09d2510286e9e4ea644a6c0b51b4e00457e22ae8b4fa386b02dd3a10a37998')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
