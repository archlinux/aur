# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=blockcluster
_pkgver=4.5.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Co-Clustering Package for Binary, Categorical, Contingency and Continuous Data-Sets"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-rtkore
)
makedepends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('770f2c4c8c69a0d5b560138a3cb1d9e3')
b2sums=('948a3a023e0f39686c37e0dcbb1c21ce67eb03f60164c959c11d7ba6a537da5397b7f01b5fbf320d897dd34b46c1a832d55c90ad790540d95bb6fb56932d4e26')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
