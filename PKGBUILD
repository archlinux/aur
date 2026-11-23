# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MicrobiomeStat
_pkgver=1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical Methods for Microbiome Compositional Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-bbotk
  r-dplyr
  r-foreach
  r-ggplot2
  r-ggrepel
  r-lmertest
  r-matrixstats
  r-mlr3
  r-mlr3mbo
  r-modeest
  r-paradox
  r-rcpp
  r-statmod
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-dicekriging
  r-randomforest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d1615099a03ba1ce478856a7f404915d')
b2sums=('20df57a5679c70dced9801ee898a4a0f7cbe105e37500fddd7e210b46a98ed88b1cd257f68eb23a6b4345f4887e5f69f2731602d3aa430d95add5c90b9a18fff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
