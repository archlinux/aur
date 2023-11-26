# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TCA
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tensor Composition Analysis"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-config
  r-data.table
  r-futile.logger
  r-gmodels
  r-matrixcalc
  r-matrixstats
  r-nloptr
  r-pbapply
  r-pracma
  r-quadprog
  r-rsvd
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cfd6fc03ef50d2b7685ee902f44d8ef6')
sha256sums=('8bd3ab276b966802b0022cccefead65d2c3f85ef43e775ff629b907c2ad0d7bf')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
