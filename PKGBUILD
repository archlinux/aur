# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=roastgsa
_pkgver=1.2.0
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
md5sums=('50670f4deac2914639b00ebac2fdc304')
b2sums=('d11665d17cc859d765cbe4e1ced1451722252ebb80bbabf0358845bbbe7faa1cb8d0de6fb7cc86683f45d7b05f460db40e3b0223157bfd1e5980c0856544d4f8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
