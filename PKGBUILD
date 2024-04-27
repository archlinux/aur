# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BSgenome.Scerevisiae.UCSC.sacCer3
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Saccharomyces cerevisiae (Yeast) full genome (UCSC version sacCer3)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-bsgenome
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f2d8bba69c3dcebf426d9b19a6bed30')
b2sums=('d866d8ebd1eae83400f2adffd75424574301d030893f6d0a6c65240b75d00cccf013da3460cff92f64198bb54db19aa4b8cb01b89f86aa20715d7f16854ae4ff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
