# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenSA
_pkgver=1.1.14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="R Functions for Generalized Simulated Annealing"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  blas
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9fa83600929fd3bf4a42a8501c32d478')
b2sums=('70092c36dcb1943ed54e53d0c345989af30684ad6f6d2f00243fb809220488879a13d863e3f6c371710eeaef49fd13c595599c0733061544577d09d5c301616b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
