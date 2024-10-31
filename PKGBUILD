# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LungCancerACvsSCCGEO
_pkgver=1.41.0
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
md5sums=('98b460ee8f68b5947b3a3761b3826dc3')
b2sums=('3226c13a91ac53ae926f3bf17eebd3cf3c8702eba7e65c0524a2016f9c7788ae224f407fbc3b922329ae979c37367305466cdf7a1123b725a7d4e52c0284f3ef')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
