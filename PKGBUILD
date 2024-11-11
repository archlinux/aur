# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=CVXR
_pkgver=1.0-15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Disciplined Convex Optimization"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-bit64
  r-cli
  r-ecosolver
  r-gmp
  r-osqp
  r-rcpp
  r-rmpfr
  r-scs
)
makedepends=(
  r-rcppeigen
)
optdepends=(
  r-covr
  r-knitr
  r-nnls
  r-rmarkdown
  r-slam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b474e937e03e7f7b876d33fc959ed800')
b2sums=('c7a8e9b0e2552054f6a250bcb994f482a39888c7d815e943cd46adb2c3411c8f57949626ee0a2aaf1393ae22e7add303a6bcc6e68fb74a2abc00f8d07e13bb4b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
