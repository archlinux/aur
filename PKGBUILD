# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sm
_pkgver=2.2-5.7.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Smoothing Methods for Nonparametric Regression and Density Estimation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-gam
  r-interp
  r-misc3d
  r-rgl
  r-rpanel
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('afde78c3caa77199372a9598e7b65692')
b2sums=('0ebbf2508c9f052ff23006414833f853a6d078c64034504a5edab2192d581cf2ce1b876fc73c761492d9f56d1414fa2df713de48fcc385102e440fd4a7993628')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
