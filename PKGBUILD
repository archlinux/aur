# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=scs
_pkgver=3.2.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Splitting Conic Solver"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r
)
optdepends=(
  r-slam
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0fc5d31cd1f6eb26815b0ef77829f30f')
b2sums=('45d9b825f93b439fdeef7962389e3376caae2fa1fa1ce7a2feb973cf7261690911bfab12fd6c56ad52e8379b7f2620b72986dd32e686cb85704fd3a5bef374f4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
