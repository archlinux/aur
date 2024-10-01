# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gdistance
_pkgver=1.6.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Distances and Routes on Geographical Grids"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-igraph
  r-raster
  r-sp
  r-terra
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b05db220814b6d2a5a4511dc33522d5c')
b2sums=('bfa9a2ba62867b395a828d84c7479ec837b69737480af1f93948f9f23db70f5f1207a9c1f06c2cab885b74c9dc53eaa290b91353ec40207a56962ca30d74dd71')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
