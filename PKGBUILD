# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gss
_pkgver=3.0-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="General Smoothing Splines"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4afb0a00b943cb43a56946684ceee949')
b2sums=('0e77beb06e6449e5c4bbad8d54dcfa316571020cbcfeb9072d2c37a3a382d8bb48e19b0cd21a0ae0573dbf43f75ab8a0e6c18c0dcefc0a908c77b8ec9a66acfc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
