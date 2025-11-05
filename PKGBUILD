# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LungCancerACvsSCCGEO
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A lung cancer dataset that can be used with maPredictDSC package for developing outcome prediction models from Affymetrix CEL files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4af9b5ca7ca0835c7bacb056d3f0044d')
b2sums=('02b0dd29d498e334384e42a3cc8a40e25e71c3d2a6a968dc1211ce431fa890e222d0ebbcd81edfdc67d7d45035fbffe4c11181740f4bd6162c61232b61d47846')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
