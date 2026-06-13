# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rPref
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('dc1d572b7571fe91627cb93c57a5a45d')
b2sums=('ae44faeda49c67c8d044b16bd6c08d2fe6a4be780242abc807382ff840e3ca0d9ee6addb3da29277ec6156bad68dd5cc648061f60f356c02ee2f49ec84e2342f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
