# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=skmeans
_pkgver=0.2-19
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spherical k-Means Clustering"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-clue
  r-slam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1da2c0d1de7446eeb4ce39e1cb516e8e')
b2sums=('a6870f81cfe9d559c1ae830fbe62c54531c9c4ea25cfba2d7ec081dc592b740c87e96e0bb3b9aeceee5669cf610bd89c0205a5d6742a301dfb0e5d6130747bc7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
