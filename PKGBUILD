# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=oaqc
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Computation of the Orbit-Aware Quad Census"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-igraph
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('035a9d6aebcc688ab3cb16d3d47a28cd')
b2sums=('74f44785b29d8e9994d3cbf7915c035e05b7d1ba2e5431430ae74b4c25ada532f5f9cf06785a1ceee68986fc78951e552dd750d08b5f7ef879370d6062e661fe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
