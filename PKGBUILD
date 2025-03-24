# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppZiggurat
_pkgver=0.1.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
  r-ggplot2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3139326eadc151b5d5db8014e3a1fe88')
b2sums=('a61d5bf3a37e41619eda96085417d7ad83df30a86e83f98e54cba6e58d4a9bc244c95b786367b99bb4b6e88015c04868dd896d5133624fbdb20b66aa73ce4a34')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
