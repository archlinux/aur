# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BB
_pkgver=2026.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Solving and Optimizing Large-Scale Nonlinear Systems"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-quadprog
)
optdepends=(
  r-hmisc
  r-numderiv
  r-setrng
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7fa0019545d4f44ecd3466b242f5f51d')
b2sums=('98dd510bfbc4db57f75b9722b18315958ffd1d77634ece053f00a695f49860bd48672901214fe2193f4a679c6a2805219d97f1e11d5bad89a56d225c1dbefc84')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
