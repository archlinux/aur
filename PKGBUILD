# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=roastgsa
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('83d20d90ed18c719222042ae3d9f46d3')
b2sums=('6249a11b17cd1e80eb8e9967039377d76e095c3449be4419ad33a3eb02b876c73898fa8fb45cbf24c7e5be270e263c0f0f02f0d7606fa6208da47df56eac2c12')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
