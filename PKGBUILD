# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rcdklibs
_pkgver=2.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="The CDK Libraries Packaged for R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-rjava
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b1c063c63b02f714f0b3f01ed23ed93d')
b2sums=('729cbd5b16e5256266767280b7b6bd4298a3e2d1dc49ecedfd0072da753c8ae853ef7a7539d8bddf0b869d7de8cea14adebc20c3e224b5294c6580455ce1d1b3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
