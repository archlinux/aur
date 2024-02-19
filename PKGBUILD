# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=countrycode
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Convert Country Names and Country Codes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-eurostat
  r-testthat
  r-tibble
  r-utf8
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e4ff5a21b823cf69b603aafe23052470')
b2sums=('1c81d263f8fcaf46d539027bf047ac94aa908c42d46a507de1a3d9cd3cb7f6a44726a4028bb509813a33f27449a2815ec711b300993bc423d2fbfb8b1d44df5f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
