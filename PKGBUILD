# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RgoogleMaps
_pkgver=1.5.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Overlays on Static Maps"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-png
)
optdepends=(
  r-jpeg
  r-leaflet
  r-pbsmapping
  r-rcolorbrewer
  r-rcurl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1f529d351c142976dd4a1db427fe237a')
b2sums=('cdb50cd56152923ff2a32f58fdec90ce0c417ffcdd1a5434327063ab8de0c59f293786b39cf9c91430c4b6fd082354e7897c04c66d82a257c7602fd27e278b9b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
