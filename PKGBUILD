# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss.data
_pkgver=6.0-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data for Generalised Additive Models for Location Scale and Shape"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('29afc2b91307aae87df4f9d2ef626f94')
b2sums=('43e186449e22d9fc186e66c197fb6a8e005894a76ebd7ab298de149c716dce6ae874db548d6658cde43507a7349712772d8154454677b8b9f065310930d148b0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
