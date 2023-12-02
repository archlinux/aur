# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=genieclust
_pkgver=1.1.5-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast and Robust Hierarchical Clustering with Noise Points Detection"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(AGPL3)
depends=(
  r-rcpp
)
optdepends=(
  r-mlpack
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('125f1f9bee8664c716c5c50816969c29')
sha256sums=('1354cffb0bbdeb0de9e08f2cb69a232b491fba1fed89e3ee0d0430eb371f1959')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
