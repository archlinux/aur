# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=CVXR
_pkgver=1.9.2
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
md5sums=('94fd108c9ed312b782a8c45f1282cf3c')
b2sums=('30b07ebc2adb0bb9e9276f9ab295b584a0d9129ffc4963956bda0dca8f0a092accbc3540e02ce316870d5e02d50692e1ed22063309fbce12f0fbcaf51cf2345a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
