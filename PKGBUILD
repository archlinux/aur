# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clinfun
_pkgver=1.1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Clinical Trial Design and Data Analysis Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-mvtnorm
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5af2123784734234a5dcb5eeb4195c2b')
b2sums=('1645796fa64246f5f8548d37e333b96396cbfb06b3fc0c55e1cf7da17f06ee1a4f7a1ee01dc7193221900c1144705d2655206ab31e3e44dcfd5e46aa57658a3d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
