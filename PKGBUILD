# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=elsa
_pkgver=1.1-28
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Entropy-Based Local Indicator of Spatial Association"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-raster
  r-sp
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f32f570cc050f0fa1eb04a8b223db77a')
sha256sums=('7839a0d2f93c4ba9bd07d71f4ae9111ab5ef09ff46c0682436b56ce889125207')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
