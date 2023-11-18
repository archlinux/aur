# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=directPA
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Direction Analysis for Pathways and Kinases"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-calibrate
  r-plotly
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fb97e41fc733cfdff3e40661804e649e')
sha256sums=('ff1dbd1dafd681c8f68008aef88493845d05aefb9490e0c6796e95cf330acf60')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
