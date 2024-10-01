# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=lmom
_pkgver=3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="L-Moments"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('CPL-1.0')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cc1776a2c4be7a83581efda584caa8ec')
b2sums=('4d1e09692ddae134c4d2463927a16e491c2308d796ebe7ce5038f62297a1b4dc8f22b28f52f1f160c98b73d4b5fd0847d64d03ae3ca7707fbc66cffbcbeb752d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
