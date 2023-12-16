# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pastecs
_pkgver=1.3.21
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Package for Analysis of Space-Time Ecological Series"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL2)
depends=(
  r
)
optdepends=(
  r-covr
  r-svunit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('678319e13833c913f57229c5157efc68')
b2sums=('2a36b3a8b9fc1dd8ab2d0637111bba52c5babb42615f15105eebf15d5f92c724132188e4bee284dfd8d5a6e5a2855660478d5f5803132c0b37ecfb496aa0e760')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
