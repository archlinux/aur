# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spData
_pkgver=2.3.5
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
md5sums=('62a3899b6e84ac07e04e9a5999e59d6c')
b2sums=('4571b8f56bbc4b41073010e82ec2be1f9fd4d85b258f2aa5dd7a1061fcb89c23ac6aa0550c07069d44ceb7aa90b9a8134ff2c3467ccdb9518b1053db391a38de')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
