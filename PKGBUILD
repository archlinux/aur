# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=amap
_pkgver=0.8-19.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Another Multidimensional Analysis Package"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-biobase
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fcf7a268489e3eb708733728b0c8cbeb')
b2sums=('cc65626f2491a05c856262073aec4e90ae58e0535186ff4a5c0e0b6239084e7fa22a2e9b961a00f7f39681ad151b99724bbf8b014079cfac5dab0b98119b2154')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
