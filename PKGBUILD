# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RUVnormalizeData
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gender data for the RUVnormalize package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6d555946f25c036dba22d433c9e85697')
b2sums=('928dd2d24d0c720dc74ba9fa63feacc1f635b7bac7467c9e557525efbca5578b3edae685eb731573c41e4826ee677233949576ac00a0a027d28a1a597ec1414c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
