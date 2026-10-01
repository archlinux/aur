# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qap
_pkgver=0.1-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Heuristics for the Quadratic Assignment Problem (QAP)"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4f176df0bfb3400b737b42d3953bedcc')
b2sums=('34d93e3a767454229db58706a6d57fb6f9dd4190006d88e5b2be98022eedff5dc21dd04645da868ef57789cfe5053fb38bd5e6a42109365744ce703534f7cec4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
