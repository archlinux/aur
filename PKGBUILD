# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cplm
_pkgver=0.7-12.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compound Poisson Linear Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r-biglm
  r-coda
  r-ggplot2
  r-minqa
  r-reshape2
  r-statmod
  r-tweedie
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b4a24e46694dd05ac9315070b5ac38a3')
b2sums=('030ca58ad81c026a54559275a2dea045f9e2dde134d0ef29ee108cf72a9d31a3b280422486f052e0b94c7046661b859f60e554a015884d087f79e95f79f2fab8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
