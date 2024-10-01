# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RgoogleMaps
_pkgver=1.5.1
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
md5sums=('e1c161a7daed4d7aaef73d5005e97be1')
b2sums=('8d3dff9023d1ba317f6a3e4196a61cb9c4e5250fe06ed02296d8d6cb8417593572cff973e6838ad84b7cbb97836da3c0de2673bbebc06f0963f26107e167d489')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
