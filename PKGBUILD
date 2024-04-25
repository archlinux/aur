# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tidydr
_pkgver=0.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Unify Dimensionality Reduction Results"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
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
b2sums=('12ebe14aa38f46d60bad6d904bebca163310a5debfcc4cb7cc602c90ebcda8cf1d4f29e05c2d2a70a0e7328ce18d4f665a1e6c902a1299f04b77691f3544751e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
