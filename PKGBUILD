# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NeighborNet
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Neighbor_net analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('CC-BY-NC-ND-4.0')
depends=(
  r-graph
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d39375ac39ea34b0bd06ffd019eac6ee')
b2sums=('895783555f8a431a8b0b7640c9b2d1dce32b14eb56616a770f2fef884a5643b252f038a72e8d47612f74ee91fd79f01559da1d6d38fa112204afd5f40ec0b314')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
