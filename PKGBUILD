# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ncdf4
_pkgver=1.23
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface to Unidata netCDF (Version 4 or Earlier) Format Data Files"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  netcdf
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e6ae790c0ab37face3236ef0c2669685')
b2sums=('580b7f9d306a6cb92b17903d6a133b774037d1110ca65b3f79253171da2b1df4ccaffeab64aab4efeaf5b6f97d0a737b9bf40a7a24ff361b7df713cde2510c4d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
