# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sgeostat
_pkgver=1.0-27
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="An Object-Oriented Framework for Geostatistical Modeling in S+"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0d1b7caa41af627124796a22d3141f12')
b2sums=('50973328b5da0db6721da63ff6b7ae6049d22ab9b4793c578965c901f7e41142b50887422c80469d51fa34dd75626bec37bb68c561deb657391f1bdcbad59d75')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
