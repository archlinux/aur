# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DExMAdata
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Data package for DExMA package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3d2a9cc7d0044ffc23e572f4c5cc4426')
b2sums=('6a80bf8d883fda93283465de330f2fc456ed074b8b0706626f9914cac7603662749ecb757be96ce1db83e9ae4ce355fec198ad07496a7db87fc52673efbbb9c5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
