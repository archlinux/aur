# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FD
_pkgver=1.0-12.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Measuring Functional Diversity (FD) from Multiple Traits, and Other Tools for Functional Ecology"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-ade4
  r-ape
  r-geometry
  r-vegan
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('793d592290cca196b2708e506b47c81f')
b2sums=('986b049c2c4a14a9ba9f3745e2315f2d4205d1982752dd480f5dcef615b88337cd1886a201e3d2fb28b259dfd8e8401aaa5d3fae01e214a67e196c8173a6aada')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
