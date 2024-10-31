# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ctc
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cluster and Tree Conversion"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-amap
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ee57a72b79ced1b575c9fe4f4b55ed6e')
b2sums=('4f17494dfc65a0f2a270e51cfc2ae835134f5b32185c742163a365b36a009fc2bc0d800da8840ab9a280bf6c5eabd37c36674be4907c619005fc4547052ca252')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
