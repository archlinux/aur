# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tidydr
_pkgver=0.0.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
  r-ade4
  r-ape
  r-ecodist
  r-knitr
  r-labdsv
  r-prettydoc
  r-rmarkdown
  r-rtsne
  r-singlecellexperiment
  r-smacof
  r-summarizedexperiment
  r-testthat
  r-uwot
  r-vegan
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3f3f831e09a89fda30c5a17723180da1')
b2sums=('0aa43d74a4b264ba404196427c88cc134fc9483b194ef96e2e2d340801e2022067b385e41e31ab5cae0a710883574a59dcaf3d877d23666085e3abd031614d6d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
