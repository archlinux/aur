# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=lmom
_pkgver=3.3
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
md5sums=('fb0427b1098ea71c3c03785f5a4cbbbd')
b2sums=('43c75dff8c578a3a8f87f3db79facf50b0ec31d41f27a002c80b2df2d56f14c03344d17a04b375141725c9bc51644fc677be37a5ab548f35cdc7ad75001830c5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
