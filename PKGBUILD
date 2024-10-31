# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LPE
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Methods for analyzing microarray data using Local Pooled Error (LPE) method"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d9b6f891378d49b442bdb39e0fa9b567')
b2sums=('925d5f8340d639edf4e12caf34fb6b4cc90fe5f923c9252cbba88bb0f880641d6fa00142261609c3642c458db751e4d5d32c48e0adbb2e0d93052722d776996a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
