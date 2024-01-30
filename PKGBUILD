# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=densityClust
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clustering by Fast Search and Find of Density Peaks"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-fnn
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-rcolorbrewer
  r-rtsne
)
makedepends=(
  r-cpp11
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c0ac3de082d380e4c7f2a04a6a573c0a')
b2sums=('a0692a519402cb0932fd08b9fc489a604d39ea74496ef47db4fa0efec1830447b2152c353d8130de913cd5290bb38bcdbc995171e6b52db1a4b9eccabbda2633')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
