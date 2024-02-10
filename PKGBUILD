# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomicPlot
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Plot profiles of next generation sequencing data in genomic features"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocgenerics
  r-circlize
  r-complexheatmap
  r-cowplot
  r-dplyr
  r-edger
  r-genomation
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggplotify
  r-ggpubr
  r-ggsci
  r-ggsignif
  r-iranges
  r-plyranges
  r-rcas
  r-rsamtools
  r-rtracklayer
  r-scales
  r-tidyr
  r-venndiagram
  r-viridis
)
optdepends=(
  r-annotationdbi
  r-biobase
  r-biocstyle
  r-knitr
  r-r.utils
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('28964cfb6084eea62d3cb24b16e7b064')
b2sums=('e8bb9457a9e8f30d4bc31100d8912d42ee130cbd6f37678bf33bb2f2ffd5d2bea1807f3c2edeee9e767f235326486c940991d96b217f17c634323f276feb3f12')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
