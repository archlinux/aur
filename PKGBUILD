# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=paintmap
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Plotting Paintmaps"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dfea07c16287fce1eca4d238b3b2a46e')
b2sums=('c1ad345649427cb3436874e70118d81414b2b8c21ab8203da798cac0184ee54e8c66188d8a56f2036fa08fe0c5b397f776778305027df6450eea08aa833e3a3d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
