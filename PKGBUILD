# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggm
_pkgver=2.5.2
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
md5sums=('67461530b539fe5d4adb00c5ca55eaa2')
b2sums=('65984b85a056bfee8aa49dc14288ab2bfad6a0b5381c6f118d4b4f8df0ce12905ff28e9bfb2a2ae444393d0e9e98814109686d4608de60d53521185cc40dc022')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
