# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gss
_pkgver=2.2-10
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
md5sums=('1137abcf14ddb41297c99c6d88d31c97')
b2sums=('d134390891ab604e1dea09682722f702b9e3d5240099bc7e1d5a1ab6dcbe302d6ed635e4033bff6ffeeec474e6a1ea55420bc5f9c5927f12ba01dcbd61eccd4b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
