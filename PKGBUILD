# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HEM
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Heterogeneous error model for identification of differentially expressed genes under multiple conditions"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ca5a8085754b953f0ed220ebe340d34d')
b2sums=('271c553359afd40c33d20e53cfd198780997d17805207a7ea8cc9304982c7ead81a5aa2a2202c4b9b72f9f8260816f964aeabb081cc795f0ad8f8895ab0a2054')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
