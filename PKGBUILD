# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clue
_pkgver=0.3-68
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cluster Ensembles"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-e1071
  r-lpsolve
  r-quadprog
  r-relations
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cb7c5175d1d59bfebdbd4529724a099f')
b2sums=('3870670c10c228db6293f169e69eebe9161a08cf1e9a18c0cf767b7080b88eaa2d54e8b2fe8e58462e266d54f1752e304f68930d3a90278998a6ec21c3ba80e3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
