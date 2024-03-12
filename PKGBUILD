# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ncdf4
_pkgver=1.22
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Interface to Unidata netCDF (Version 4 or Earlier) Format Data Files"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  netcdf
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cdfddec28e78da74ed216052d469a585')
b2sums=('db09895e90844e897072ad8c4d2f7c5b286326c8878969302be2a213471fe82f0d451a7355a6a448a9c4205f22146be87aa4c45d84aa90cfc2f4c3b090c202ff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
