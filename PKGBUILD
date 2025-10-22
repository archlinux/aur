# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=unitizer
_pkgver=1.4.23
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive R Unit Tests"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-crayon
  r-diffobj
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8520659d16640ec5057db2f3d3d5de76')
b2sums=('c2bf9c08dd55df44e4ea3c35bf81e76e66ef30bb1cafa7a5be55b4c9643d257b83626bcad8a2fc5d95e344e3599e9507118f99de36f24e3aa66b9a2f4729e1e4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
