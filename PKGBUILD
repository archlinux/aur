# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IsoformSwitchAnalyzeR
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('6aad6b0133da9e103b4385ff31b7028c')
b2sums=('238078c28345b304f1a54970bd924414ad95da87acc417c4c6b3a840deb052b914e7b238ded7ee3e2f2ea23d9ea91153cbd04961b5e915d30a2e750f9abf7bb2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
