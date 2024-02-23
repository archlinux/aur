# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=blockcluster
_pkgver=4.5.5
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
md5sums=('229a6a56d3653a9c8cdbb7837da8a561')
b2sums=('5cc00e76666906771c730b3008533097fc9a40b3c1944735ad444ba93d01dcc819c32495bb4785ca9d1fe52c09ae542850ac1dcfc119a206b01c482e90a4372f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
