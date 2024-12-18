# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IsoformSwitchAnalyzeR
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identify, Annotate and Visualize Isoform Switches with Functional Consequences from both short- and long-read RNA-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-dbi
  r-dexseq
  r-dplyr
  r-edger
  r-futile.logger
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-iranges
  r-limma
  r-magrittr
  r-pfamanalyzer
  r-plyr
  r-pwalign
  r-rcolorbrewer
  r-rcurl
  r-readr
  r-reshape2
  r-rtracklayer
  r-s4vectors
  r-saturn
  r-stringr
  r-summarizedexperiment
  r-sva
  r-tibble
  r-tidyr
  r-tximeta
  r-tximport
  r-venndiagram
  r-xvector
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7818e5233168673220445e38a823ce51')
b2sums=('2c74eec3ff54c4e4517a4098d10727495540d1e76f8b36034cdb29224a014d8be014c7d29ea6fa153a77a5d98c08b94e4405d26c9d79fccef70abf9be4de61f9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
