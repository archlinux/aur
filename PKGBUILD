# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CodeDepends
_pkgver=0.6.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('7613e483a27e4e449cb4d3b443846a47')
b2sums=('8ceaa69d7bf88961640fef02de4cf8516937380100a349e9a23d11016e116895debba664637b4a0aefac7ca39ed42b1d15eeb79a1e6b15d75e8aa57f1bef757d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
