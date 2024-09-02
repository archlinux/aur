# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spData
_pkgver=2.3.3
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
md5sums=('9e935882397dcd7ffc9d6fa2a1d73017')
b2sums=('2d64a2ef76b147a253e53a965957bfa665170c96eb3779472119c31b94d4eeacc533149293b50db297c49b0f401ec17c0a97d0325ee3b5d5d9154f86025533c3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
