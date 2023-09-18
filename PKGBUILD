# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ICSOutlier
_pkgver=0.3-1
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
md5sums=('fa10a0382eca38828a17a2569d809866')
sha256sums=('a76ebcb2156e3c093329a46d5ffe8311845ede16b663893b1d9542dc33111702')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
