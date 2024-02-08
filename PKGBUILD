# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=remaCor
_pkgver=0.0.18
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
md5sums=('cc6ca79d2f7319e40e2ffe27a19ff598')
b2sums=('fa4ed0c63ff0264831826a1841fca82bcc9e26f11baef613c42d4d49d70e784efde6fdf0c144585dca354d4318d0c72aaf89dbcfcc093e914a49d981d3898af2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
