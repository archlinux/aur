# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IMPCdata
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Retrieves data from IMPC database"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Apache-2.0')
depends=(
  r-rjson
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('47dcbf0e5a418fee9af74515664c45a7')
b2sums=('db7138214f0838441d64c8a0900d370f8361dee3c9abc9531a6d71e4a8f7865a766fd590b8c54322a2afa1578cf623e511e2a7d882a52475d8eb242c8c07fb61')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
