# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppHungarian
_pkgver=0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Solves Minimum Cost Bipartite Matching Problems"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rcpp
)
optdepends=(
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1ca77b7707cb433d5ce9a0fa1f58b8cf')
b2sums=('dc9781e5764311517dd56c5ceff48029001149dd2f21284de4eea79e183897b3ac08caf1e09034764aa41de5a3889097edee1cb725495c5031a6dc1b80b55f60')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
