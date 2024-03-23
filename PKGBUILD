# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=countrycode
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Convert Country Names and Country Codes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-altdoc
  r-eurostat
  r-isocodes
  r-testthat
  r-tibble
  r-utf8
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3b65037b69a3ff0a348ecee6e9659285')
b2sums=('2eac6eef00b54d052e227147b1e652dbd4d16c5734fd0d8146e7ed02d80bf0416781d5b0c6eeaaf84e40cf0f22330312fc2028e50df2697c7f24745c3ae187a7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
