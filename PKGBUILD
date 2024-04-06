# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomicPlot
_pkgver=1.0.7
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
md5sums=('d90d164e2333313ae1c07b720eb74b7c')
b2sums=('aba91fe99c8698b11cfcf856d9923d9efe6997dba81425da3a3fe03599223a2619fc5751f96b77caed9fd52b3cf22c994dac7e34bb7fe17966a0553db7a56372')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
