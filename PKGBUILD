# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alphahull
_pkgver=3.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalization of the Convex Hull of a Sample of Points in the Plane"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-geometry
  r-ggplot2
  r-r.utils
  r-sgeostat
  r-spatstat.geom
  r-spatstat.random
  r-splancs
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3f1cc3022b4f6daa6bffe1d432be9eb3')
b2sums=('6ab4ad22cba7c592d8e60e4afeca05cf65178d7c592adcac1ec21c78b64bb24b4de62f1c42f4571076ab3b75e659b8dc6edcee9398f352fbc63ddf6162796bbb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
