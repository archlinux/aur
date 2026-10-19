# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=CVXR
_pkgver=1.9.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Disciplined Convex Optimization"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-clarabel
  r-cli
  r-gmp
  r-highs
  r-osqp
  r-rcpp
  r-s7
  r-scs
  r-slam
)
makedepends=(
  r-rcppeigen
)
optdepends=(
  r-jsonlite
  r-knitr
  r-rlang
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d794b01fc66baf6f199ebdf539138a83')
b2sums=('8fa02743ba90604165be9a00a267e6427164bcf7d4ea8f343f5401ef147303941ae09cc073e4dc2daf7f4a74790369c1fcc90d3d37632c22a5584b23f8b8da69')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
