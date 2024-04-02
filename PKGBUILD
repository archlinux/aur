# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomicPlot
_pkgver=1.0.6
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
md5sums=('ba18ffa9cfe60cfae0491eccf78f26b0')
b2sums=('8d05b6f2bc025ac7494f66c0306d5ac2819aa60d0a43657402b8c831afed588a10914d7be9b5a55b23afaa482e45030ca0937042242ef2742894f2a480fef5b1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
