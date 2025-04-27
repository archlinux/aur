# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomicPlot
_pkgver=1.6.0
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
  r-txdbmaker
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
md5sums=('4574c42129d1d53bca82f93a84e3f99b')
b2sums=('c3e9b4ad3f80c5fced1be6be9cb49c438e79887c0b325d1dfb3021ced386ebeaf34bfcf008e84b91d77744a176055969a0b2dfb35387f26cca019558d4088275')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
