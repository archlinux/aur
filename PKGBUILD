# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rifiComparative
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'rifiComparative' compares the output of rifi from two different conditions."
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-cowplot
  r-devtools
  r-domc
  r-dplyr
  r-dta
  r-egg
  r-foreach
  r-ggplot2
  r-ggrepel
  r-lsd
  r-reshape2
  r-rlang
  r-rtracklayer
  r-s4vectors
  r-scales
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-writexl
)
optdepends=(
  r-biocstyle
  r-desctools
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d371dc0f2b156f4565b09b7cfa5406e0')
sha256sums=('3175cb710dd786c8c2d3d9f2067c86f253d8023548c6e2664393a656308e7e99')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
