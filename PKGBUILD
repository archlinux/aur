# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pdfCluster
_pkgver=1.0-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cluster Analysis via Nonparametric Density Estimation"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r-geometry
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('44977c813b151392cc3c91c8403e048e')
sha256sums=('d510c63ce1825d0acd0204613f880969402c731267b4ff800c8549fd73eda234')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
