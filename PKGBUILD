# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=relations
_pkgver=0.6-18
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data Structures and Algorithms for Relations"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-sets
  r-slam
)
optdepends=(
  r-clue
  r-lpsolve
  r-rglpk
  r-rgraphviz
  r-rsymphony
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d3440b78a890cc868146f7ed690c278')
b2sums=('79aa819053baa74bc52d5cea67a073857c0cbb13d0848c7680eaf17a3edb69819b9ecdf8a6c770909cf80c3e23a335b485f05d7c0abe1e08fdf1114334b3cc1a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
