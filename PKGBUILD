# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=remaCor
_pkgver=0.0.16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Random Effects Meta-Analysis for Correlated Test Statistics"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(Artistic2.0)
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
md5sums=('f7e15c9dc1c0064126189c151fcc8f9d')
sha256sums=('7897cd449e62ac1e79ed74055a077d809dd7547448afe78246fc6b3cbc90f6f7')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
