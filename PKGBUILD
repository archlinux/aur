# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=roastgsa
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Rotation based gene set analysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('83d20d90ed18c719222042ae3d9f46d3')
sha256sums=('705d83610754235e57d8eddd828caa1eb7296029d963507a68d0d2073b5861b6')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
