# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggm
_pkgver=2.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Graphical Markov Models with Mixed Graphs"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocmanager
  r-graph
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('db8c249f2c58705be639f0757e9dfaad')
b2sums=('a10949cc802c3948d463f19d62c6342ce72daaccd8bf80a058574c88206c0ba1461e33a1950fde1dfbc687d65d8d83e73f0bde11fac119336d95b6deff5fd92b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
