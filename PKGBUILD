# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=remaCor
_pkgver=0.0.20
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Random Effects Meta-Analysis for Correlated Test Statistics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-envstats
  r-ggplot2
  r-mvtnorm
  r-rcpp
  r-rdpack
  r-reshape2
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-clustergeneration
  r-knitr
  r-metafor
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('79132fbb68e5868c0d9554f48c71e304')
b2sums=('809bcb9c038fa2faff9068c7843c6dd1b65fe7f8211fc3dfb296a5c04252d796770b84bba614f799feff374332610991760d0c8d001098c8747bee5362fcf6cf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
