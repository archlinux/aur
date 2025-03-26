# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ncdf4
_pkgver=1.24
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
md5sums=('876f66c31ef1d2df9a30c2c87376462c')
b2sums=('bf14b461f567791e16f29ecf1b8fa4416a68a8f4eadeab46ac61d0ef8eeb9ddd50295430024d2d0de1a9706cfa4716bfe04a94521ab3091e121ed9e94daece53')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
