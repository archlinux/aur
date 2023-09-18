# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ICSOutlier
_pkgver=0.3-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Outlier Detection Using Invariant Coordinate Selection"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-ics
  r-moments
  r-mvtnorm
)
optdepends=(
  r-repplab
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('57b4f80689eae3bc3125d5331418230b')
sha256sums=('b0ba24ae98932565f367c5960312fd9f701fa607bd5a4cde846f5ec43ff141ee')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
