# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TDbasedUFEadv
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Advanced package of tensor decomposition based unsupervised feature extraction"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-dose
  r-enrichplot
  r-enrichr
  r-genomicranges
  r-hash
  r-rtcga
  r-rtensor
  r-shiny
  r-stringdb
  r-tdbasedufe
)
optdepends=(
  r-biocstyle
  r-knitr
  r-mofadata
  r-rmarkdown
  r-rtcga.clinical
  r-rtcga.rnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6f873403b62f756c6b8424cfeb2409c9')
b2sums=('6d5823632f58b39bae11c1259f62c2160348e315254daa233c9c22bbe5fa793b211df62e8482e0006dcd139c60158594ffbc758793aa612a85709f65b09b692f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
