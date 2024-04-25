# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppZiggurat
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="'Rcpp' Integration of Different \"Ziggurat\" Normal RNG Implementations"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  gsl
  r-rcpp
)
makedepends=(
  r-rcppgsl
)
optdepends=(
  r-knitr
  r-microbenchmark
  r-pinp
  r-rbenchmark
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('53115de66376aafe087e90ff166d6de1')
b2sums=('e353fe8ae3530226f960cf9892b8bb5ea4ad2f7f0950fb8552db12d6c6835909e0aa5ade96ca382c84052f6e3c8384a55d11da94feff2a64bac74653b05a2794')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
