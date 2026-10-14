# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
_pkgname=fields
_pkgver=18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Spatial Data"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r-maps
  r-rcolorbrewer
  r-spam
  r-viridislite
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-mapproj
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${pkgver}.tar.gz")
md5sums=('e709ac0d3f815a854f86c35cf8b7b3e9')
b2sums=('2127a5507a077539f9a44b58d57a28d5aa1f37221339080ac70f108ae7919d7b8e86e102e44d8f7a1fedd173908243f2f9b3f1a959981338d59860574aca9766')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
