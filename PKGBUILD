# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TDbasedUFEadv
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('dc279b86de7bdf44f5ca736bc9ae50f7')
b2sums=('c5047792e389480aae44e80175c4dd625fb5b22b0af13b554f33047d35f5f0655d7e3ef7a2d68ccdfff9e3683c75d7decbea3f5d618bdd4ad12cdb4e35fc99a2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
