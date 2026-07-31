# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mclustcomp
_pkgver=0.3.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Measures for Comparing Clusters"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-rcpp
  r-rdpack
)
makedepends=(
  r-rcpparmadillo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('56aae293cb4031f77ae018c30b68f965')
b2sums=('fdd2b571f1fdddb68e52ade77b225d811cf478ff98419cb5f385f0222939467d0e760eeb90acdd2f3ca239445f3e170acc2de09e5e7e4d8547f49772bd54227b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
