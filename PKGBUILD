# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=roastgsa
_pkgver=1.8.0
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
md5sums=('b77431a7ad8c5146899caee9872e601a')
b2sums=('a70d1ca241469762f2f2f2a723de889f39e666d3836815dbb93830ec1bd7e9f62b125c4ec45ef1f0b60617b5489c1554b9f1f1070fd2dbfb2f77d3e4b91afc57')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
