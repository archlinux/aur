# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=DistributionUtils
_pkgver=0.6-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Distribution Utilities"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-generalizedhyperbolic
  r-runit
  r-skewhyperbolic
  r-variancegamma
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f57fbeda6de9fd18a226c620155b7408')
b2sums=('5514790c3ed6c9af009f29410b82e754eee4a41fe44fd147125f3f6d3bac9b16120f079f0ba53d5c840ceb1ade9cc2239e0ec28ffaa3dfc1cb785c3ce9bffb8b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
