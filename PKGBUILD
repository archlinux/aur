# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BRISC
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Inference for Large Spatial Datasets using BRISC"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
sha256sums=('89e44bf9f684c948c3c581c732fe8b4b27607e7506e3948dc4da3eca06a8f71a')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
