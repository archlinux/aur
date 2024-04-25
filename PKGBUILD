# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BRISC
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Fast Inference for Large Spatial Datasets using BRISC"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r-matrixstats
  r-pbapply
  r-rann
  r-rdist
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c82f874ae549ae510030a8c6735bccc2')
b2sums=('008b348d2f0b774355c38b7cc2a9710e20129348ef9d2a87e8d985ff55c6c7ac32128d8241d412228de66d85bc3653b37bd25617a1e90c47507ea8d760e31335')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
