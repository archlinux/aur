# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=relations
_pkgver=0.6-17
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
md5sums=('c7284549ba485e67c056e65bb0e109d5')
b2sums=('7b8fa259d46050fc2527264cc4d5fba31576741847d75dc43a4f54c31b2b7750de0145d2ad779f10d7c6ce22bcf082399071a3b5c302c059cdcc821e37d0ee42')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
