# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spData
_pkgver=2.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Datasets for Spatial Analysis"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=('CC0-1.0')
depends=(
  r-sp
)
optdepends=(
  r-sf
  r-spatialreg
  r-spdatalarge
  r-spdep
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('41aae4a68e1e038d28ff80af8388ee8f')
sha256sums=('4b2c1f597049f2c78a7e2b7538c067e2b57e2f12291d19210b1eef702664848b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
