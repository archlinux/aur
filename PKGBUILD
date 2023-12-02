# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mixedClust
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Co-Clustering of Mixed Type Data"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  blas
  lapack
  r-fda
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
  r-rcppprogress
)
optdepends=(
  r-knitr
  r-ordinalclust
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('096a0f3bf316996db2fefca0f55d9fa6')
sha256sums=('1538f352f4662c9a4a0f23dd657547992a9011e03d00173bd80c9546b5d41e82')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
