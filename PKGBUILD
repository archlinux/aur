# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomicPlot
_pkgver=1.2.2
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
md5sums=('7d8773a452b482725e8d0c2da742bb11')
b2sums=('6d9cc5ea4a173880fc87fc1a6e5aa905c3a538a53c65043a32b1a1e4ebba088440e9548b987b4f8f297c962bce9e3a3845573d8210cfbd208f721f6fda612c0b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
