# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IsoformSwitchAnalyzeR
_pkgver=2.8.0
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
md5sums=('38363ce3a91427e534ea9b1c06ff3fd7')
b2sums=('cc6f0b7bf43f9387d16a4caca7503999301f5c7872d09e0f9539f46aa27567622c9a11c388a0b46e9dc2bc8bd13a2e4ee7ebb8822161b8661df160e87b6e9710')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
