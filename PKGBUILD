# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mclustcomp
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Measures for Comparing Clusters"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-rcpp
  r-rdpack
)
makedepends=(
  r-rcpparmadillo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4e83a5125dae0ec5754bd0a76ed240c5')
b2sums=('df813fef77242f2ffe12bc552f241745db0f1e6db25ebfa07ce2e487894040c80717b33307a6361e9cdf01a4cd2b25e57d89fc3edc472f67173180af6b725f29')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
