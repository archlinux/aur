# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qap
_pkgver=0.1-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
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
md5sums=('b809a006c224259c932942f0dccb3577')
b2sums=('709bd95b5387aa89aed8acd77675bae5f3fe4845b45fa352f0986e6f74b6d206760797a1baffd47f883b8ae33d3730a40f2d45b515855d0edb0489a88f324403')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
