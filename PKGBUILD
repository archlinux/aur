# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spData
_pkgver=2.3.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Datasets for Spatial Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
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
md5sums=('0739960d1dfd343666c6eb9b0f2f5ce9')
b2sums=('2462173e2b97fd9a70a738b134df937321a87cccd2c0d7cba37e29f199a7f41544b43f47da5e7834241f1b386c232d600338efed63a69f4cdab557cbe3fcb6db')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
