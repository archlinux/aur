# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=blockcluster
_pkgver=4.5.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Co-Clustering Package for Binary, Categorical, Contingency and Continuous Data-Sets"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-rtkore
)
makedepends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('795bf2ba5d141bef2ce84af9dc94b3c2')
sha256sums=('11b8b8892faf9f03784f76673641652651230b0459472d2d4141fc0d305ac325')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
