# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rPref
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Database Preferences and Skyline Computation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  onetbb
  r-dplyr
  r-igraph
  r-lazyeval
  r-rcpp
  r-rcppparallel
)
optdepends=(
  r-ggplot2
  r-graph
  r-knitr
  r-rgraphviz
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0ccb5ebbd5143f4a25fb38900bf84f64')
b2sums=('68d293a70c04883b7816d7f1414527db7ace8b5456bb99bb1afaf88852109c227952321cfb5a0edc0d403dcf759acbdd7490344688c85ae9a6cc5e98b888e80e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
