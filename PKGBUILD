# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coGPS
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="cancer outlier Gene Profile Sets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-limma
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a824d8a41fee47628eb7f369adef4a2c')
b2sums=('93638d4629abbc5660873ef47fe7c49025cfa8dc8d3bde46631c7c96b014a382560a6e5f7be643d6a0ef622d90cf32de3eed9cdcd82808b06898004b218ef4f6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
