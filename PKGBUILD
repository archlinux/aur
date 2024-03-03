# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cplm
_pkgver=0.7-12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('7e68360c5d12ae72a5d8054526152ab5')
b2sums=('89c03c833193a057d6677ef837114212d886da5345f9f027539019da03ccce99b880f6fed42454eec148710fb4c68a786420ae5bbfe8b5ebd395afc7e0e6c920')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
