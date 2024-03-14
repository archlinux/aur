# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=enviPat
_pkgver=2.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Isotope Pattern, Profile and Centroid Calculation for Mass Spectrometry"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b3bf71eccf0c915ddeadd2e0bfbfa3d5')
b2sums=('34f621614d95c312041b83c21515dd7278ccd7fae0703638c0e0eb0905840709ac2277185e69f27467ab3af2e110c4f5b2d7c44c86a7e4ef3e910ffa9962bcde')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
