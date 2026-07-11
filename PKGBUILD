# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=rbenchmark
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Benchmarking Routine for R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2b8e858c31505499107ca0db3de54f70')
b2sums=('fa890619c044bb421977ba3215237fabf7d618bc2c1e4f9e9f73b60829042f1eba714cc68da1b3d7548d50488ea262105ca0180f0192fe94304e97028e56dfcd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
