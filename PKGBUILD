# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dismo
_pkgver=1.3-16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Species Distribution Modeling"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  java-runtime
  r-raster
  r-rcpp
  r-sp
  r-terra
)
optdepends=(
  r-deldir
  r-gbm
  r-gstat
  r-jsonlite
  r-kernlab
  r-randomforest
  r-rjava
  r-rocr
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0a89a0952b3e221a7eeb48f6042f0d3b')
b2sums=('4c8cac10a03e762e71013f97c06082b3e6c58e5a193aad6d32364d8fd8ce6164f13f930d1cbf8e1f1b2cd67e43ed6eee831bd6e7c150a1319d58b63f162d9a40')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
