# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=genieclust
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genie: Fast and Robust Hierarchical Clustering"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-deadwood
  r-rcpp
)
optdepends=(
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2fc81aa66572cde6f9860abc54eea2a3')
b2sums=('a878634bf1a4510f2e455b7d5998475e36006a01bc2c0476966df0d19a7435f11d71489fe2c8bd9eb80be85e11dae9832932b68066b3e5aa35fdcfd956faae02')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
