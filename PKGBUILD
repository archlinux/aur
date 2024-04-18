# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lokern
_pkgver=1.1-11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Kernel Regression Smoothing with Local or Global Plug-in Bandwidth"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-sfsmisc
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('eea43f3bfc0418d1d8112a7f81d78b81')
b2sums=('bd8fc9055348cc6ae76e4fc550a88cac1d4d42104ac14717fbc45a8b8281f6a7b9afa30bb7eab8b5837bfbbcf336403b0e3ba73e8db9735a1eee3f94c444f179')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
