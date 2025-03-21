# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MetaPhOR
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Metabolic Pathway Analysis of RNA"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-clusterprofiler
  r-ggplot2
  r-ggrepel
  r-pheatmap
  r-rcy3
  r-recordlinkage
  r-stringr
)
optdepends=(
  "cytoscape: cytoPath()"
  r-biocstyle
  r-kableextra
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1f0bda4f5f0a9ee2b6aa60ee4cd6ffab')
b2sums=('d00d5ec26352a087ef0bab3565cf1404fc977a354ad008991def06c51f478355a1b58c1ba60383c6c789e0d104e4bdf248661dba951fa904c7ad05a5dd8b0133')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
