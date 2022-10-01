# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidybulk
_pkgver=1.8.2
pkgname=r-${_pkgname,,}
pkgver=1.8.2
pkgrel=1
pkgdesc='Brings transcriptomics to the tidyverse'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-genomicranges
  r-lifecycle
  r-magrittr
  r-preprocesscore
  r-purrr
  r-readr
  r-rlang
  r-scales
  r-stringi
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
)
optdepends=(
  r-annotationdbi
  r-betareg
  r-biocmanager
  r-biocstyle
  r-boot
  r-broom
  r-clusterprofiler
  r-covr
  r-deseq2
  r-devtools
  r-e1071
  r-edger
  r-functional
  r-ggally
  r-ggplot2
  r-ggrepel
  r-kernsmooth
  r-knitr
  r-limma
  r-markdown
  r-msigdbr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pasilla
  r-qpdf
  r-rsubread
  r-rtsne
  r-s4vectors
  r-seurat
  r-survival
  r-survminer
  r-sva
  r-testthat
  r-tidyheatmap
  r-tidysummarizedexperiment
  r-uwot
  r-vctrs
  r-widyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2f256139a8da18dc03b390dbe2b890a1f19bc17d893167fee7b032888e444255')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
