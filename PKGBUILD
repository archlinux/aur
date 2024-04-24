# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=amap
_pkgver=0.8-19
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Another Multidimensional Analysis Package"
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
  r-biobase
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0693299e20587073c234e7c4a0079f95')
b2sums=('cf3b51c17a3f2246c3398ba508d60ffef0a218d81f262dcd63994034686fe24dccaa9621f513f3034afb6485a7f2c08a7949623492d04dd1626869c91c1bb20e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
