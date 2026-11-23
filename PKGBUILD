# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=celestial
_pkgver=1.5.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Collection of Common Astronomical Conversion Routines and Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-nistunits
  r-pracma
  r-rann
)
makedepends=(
  r-rcpp
)
optdepends=(
  r-igraph
  r-plotrix
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8216cd8e5c4f8418ca521d2d6d147e51')
b2sums=('175d03299d4e4ff74cd0aab8fb2155adc99712f9caf2c92da15727a22a9489ea32c8b65835137900946d499460c4c96d4f9de3dfd3e34a52a4ed497955ffd5ec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
