# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FMStable
_pkgver=0.1-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Finite Moment Stable Distributions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3697fa5f8c5cc6acfcf0285ca7819f56')
b2sums=('f28d9b17352e3d6c0ad287512e9b08af46aafff97b5ca5287ad32f472a3a07a6586982a1ec3d93bd9bba030943880c105d9eb18df33904b4a65db97bf37844a0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
