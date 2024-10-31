# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HMMcopy
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Copy number prediction with correction for GC and mappability bias for HTS data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-data.table
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b0b3054c45fe88b26718969395126799')
b2sums=('abdfe0e9f0b7449e425717db607ad43f8143ba820b95e786f2e9343b8608a9df9d5c97fbbee2b2981328b135af32d5681023bd11909d82f39862c2e727d2fe8c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
