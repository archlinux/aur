# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scam
_pkgver=1.2-19
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Shape Constrained Additive Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1a7d5476ee3a377715725c9e07a378c0')
b2sums=('8e4da7223afc89a8df0252da245f4c1c257e0c8fd00c2d1d1005b9af93aa63f50fd9aabe755b306c08fea6686fc16c7754ffc6fb06cec8c6a0993f5fc059eff0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
