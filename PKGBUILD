# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=XML2R
_pkgver=0.0.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Easier XML Data Collection"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-httr
  r-plyr
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f10dc003aecb2d3232adf320cf593bd6')
b2sums=('a252f844ddf14ccd71aebfff2bc8bb5fba45ab7af00342a2d7a9467b77a1d9cb696392d22bd16b577f8e32305370246cc699c1cccb4cecefb0d41394bb490115')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
