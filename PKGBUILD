# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=relations
_pkgver=0.6-15
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
md5sums=('a97dd6684b1c2779c7e4c8aafe1efdb3')
b2sums=('af820547ac8404a27b5f023f2ad0da9e6d7c5800e04aad15304517cdfec62d401d5e537a40ef29a34a318898a505e4dc7df31301f987100a902285524b2b3a8c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
