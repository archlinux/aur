# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
_pkgname=fields
_pkgver=17.3
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
md5sums=('61d38fbd696c1cc5d99ae25b8ea7c66e')
b2sums=('35dbec67e3a2b15441f9368fd1fc3e3df12f9d7a1f7dba013161108b81689e268b88d8a69d2d65c8d94366b785afb2507b8fce28a8fa40d6a0c0710b1366c0be')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
