# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NCmisc
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Miscellaneous Functions for Creating Adaptive Functions and Scripts"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d3e09dcb38e0f2042a683d2c50b5da21')
b2sums=('bfbd15279bdc5f254522d4eb1d548c4329b520c986208e8b670428c4f4a28cb016fd8e53f925e93974117bcf1c62565ba79f42f0968b8a170fc00044821de09d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
