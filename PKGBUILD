# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=CVXR
_pkgver=1.0-14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Disciplined Convex Optimization"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-bit64
  r-clarabel
  r-ecosolver
  r-gmp
  r-osqp
  r-r6
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
md5sums=('6b4ccbcd7a936ea6fef53ca2a957a982')
b2sums=('2c8bad0528bbae308458838288852b2daff6e18943ce6fe8f15ace8e96d76b8b5ff4fd66879cb5dc33492c394aa07952cbcd2d07b6cf19e2c9ce64651a2e21e3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
