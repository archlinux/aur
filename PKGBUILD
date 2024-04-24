# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clue
_pkgver=0.3-65
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('ee836dd0f273667e53d2e2208e57a07d')
b2sums=('eea36f37da03b79c47af655ad06f68a0e072d1863229704c6eb6202fb89dc57cfc2f7974512cc63bc5bfbb3a3a92bd0927de3a5fa93b3964705a7a66affed31a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
