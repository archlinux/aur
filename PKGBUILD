# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alphahull
_pkgver=2.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalization of the Convex Hull of a Sample of Points in the Plane"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-ggplot2
  r-interp
  r-r.utils
  r-sgeostat
  r-spatstat.geom
  r-spatstat.random
  r-splancs
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1ea4cc665f6cde31c63cc9e50a6c801f')
sha256sums=('82104b049b945b62b5b62f1520ff789a77638ab7e91650e50d6eb191373a8012')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
