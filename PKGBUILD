# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=roastgsa
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Rotation based gene set analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-ggplot2
  r-gplots
  r-limma
  r-rcolorbrewer
)
optdepends=(
  r-biocstyle
  r-deseq2
  r-enrichmentbrowser
  r-gseabenchmarker
  r-knitr
  r-preprocesscore
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0bb80f06989dceae154848978dcaf494')
b2sums=('1bbba09640da9f51d416926ae4f97d62f2055e8838fb39779d6ca8608c7c09cea681b900d94f98c139aa63d87ab04551f08e48a290a47371ff04b4be08a9d410')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
