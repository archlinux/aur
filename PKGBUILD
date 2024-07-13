# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sparcl
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Perform Sparse Hierarchical Clustering and Sparse K-Means Clustering"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('123fb53fed12e4de49926be67c61afc0')
b2sums=('28fcfb42aded21b0a6ea8c085aa7548f0df600767a5dd3a05c4519a962a01b45b78903199b0d6987b6c5a2bbbeda27111f1beaee4b3a4933afa5c500c264c4ad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
