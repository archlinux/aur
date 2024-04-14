# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=relations
_pkgver=0.6-13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('5c0e82a37c8f7fb8b74bb5a7ad7fd257')
b2sums=('92cef36dc96a73a9e6043b11d84fcc546fe6f726846a0167414a2a5d36c9bdf9b8883a723dddee00a5a4824b33ddd90477b444ac0e84a1784552aeed3a5c91f2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
