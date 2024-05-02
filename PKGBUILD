# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PathNet
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for pathway analysis using topological information"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-pathnetdata
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('00218d4291b8f1cde08115bae2582da6')
b2sums=('0cbd2e5b2e71b1ed0cea4593d8694c828f0f86c173889f5666480d7aa6a2e5462ee25305d31563d75d80848e279192571f2d5d2e73cf3a74255ab6c21bf692e7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
