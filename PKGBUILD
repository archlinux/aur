# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TMB
_pkgver=1.9.14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Template Model Builder: A General Random Effect Tool Inspired by 'ADMB'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  blas
  lapack
  r
)
makedepends=(
  r-rcppeigen
)
optdepends=(
  r-numderiv
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0c36c848c1ed407f348043fef4a18a5c')
b2sums=('3e8f741512426e5d2ed2f4bbac99e235b04df94bea4b996f45987440260b8e6b8ddefb167cd95e3192c3c7ddc9a0e5b498471abdfc512b74851ad3fec56f6320')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
