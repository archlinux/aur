# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tidydr
_pkgver=0.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unify Dimensionality Reduction Results"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(Artistic2.0)
depends=(
  r-ggfun
  r-ggplot2
  r-rlang
)
optdepends=(
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-singlecellexperiment
  r-summarizedexperiment
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8cf7108a8128408b487e096ed4babbda')
sha256sums=('3c72a53922365a043f34bf50ecfaf9f0ab332a13c17d0910199ca948da826f9b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
