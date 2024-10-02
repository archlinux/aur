# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BRISC
_pkgver=1.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('6fb58b34669061c2498c936e9d343d30')
b2sums=('0a4d6adf678de23ccf3fdfd4c141ac2bd86b3a86df3f72877685986f46bc0b8a1561e34d603c7c3065228abf1394ea5394b0e8264c21aab09bc054350f4c8806')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
