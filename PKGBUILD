# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pdfCluster
_pkgver=1.0-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Cluster Analysis via Nonparametric Density Estimation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-geometry
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('44977c813b151392cc3c91c8403e048e')
b2sums=('48c74816cd0f3c0b3d6d37f254e8e42418a2fc7f1445495eea1e3566c222d8d3b406678aa30e582b5ea52fc4e3461fcfaa9e5ec5c1aac8fed9b29b155ffa96b7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
