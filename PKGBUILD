# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppZiggurat
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="'Rcpp' Integration of Different \"Ziggurat\" Normal RNG Implementations"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
sha256sums=('9c78255ca476c945c05a564d1e4da363de714d890e0e27f3b252fd73c50eed71')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
