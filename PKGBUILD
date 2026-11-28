# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TeachingDemos
_pkgver=2.14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Demonstrations for Teaching and Learning"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-logspline
  r-png
  r-rgl
  r-sf
  r-shiny
  r-spdata
  r-tcltk2
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5c9cfddd9fda8a1d36196920e35ec63f')
b2sums=('daad85e7fcfce43d558dbab09d3ed985cd13c753688fe11de57cf832dbae8503fb4e1cba58d800b9fa2aac9b61a793a57607ce232d470f28d7d8ded647b830ab')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
