# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CodeDepends
_pkgver=0.6.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Analysis of R Code for Reproducible Research and Code Comprehension"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-graph
  r-xml
)
optdepends=(
  r-highlight
  r-knitr
  r-rcpp
  r-rcurl
  r-rgraphviz
  r-rjsonio
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a53bbc430f100300cfd77ac17d5eabbe')
b2sums=('1fcc14437a6b63a52578af28254b42cd0fbec89e3b9ffa032a484081152eaec6197478ada79db00c37100a53281ad41173cdb40bd82f761d552c88583acdfd16')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
