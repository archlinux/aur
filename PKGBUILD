# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gsubfn
_pkgver=0.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Utilities for Strings and Function Arguments"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-proto
)
optdepends=(
  r-chron
  r-quantreg
  r-svunit
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7c3ac3d87b367aaf06a8add353fb162a')
b2sums=('3800ab96f0f9f6118aa1fd3ea9e353646e168193ef1f41fdc1f0ead56511ecdbb795cd2e0c016658ffad5ff247afb009d0f7e9419da7ed18d7c00d3511afaac6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
