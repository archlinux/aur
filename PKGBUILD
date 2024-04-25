# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=elsa
_pkgver=1.1-28
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Entropy-Based Local Indicator of Spatial Association"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
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
b2sums=('a35bc17ea7b2e8b42e1ac6831338e091bb22b9debd39ba3d9aa30e770359cdfb3338e1418212096bdf9b81e0a6caf546a41e77b7754058861b55268a6624e65b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
