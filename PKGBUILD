# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=UMI4Cats
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=1.8.1
pkgrel=1
pkgdesc='UMI4Cats: Processing, analysis and visualization of UMI-4C chromatin contact data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotate
  r-biocfilecache
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-cowplot
  r-deseq2
  r-dplyr
  r-fda
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-magick
  r-magrittr
  r-org.hs.eg.db
  r-r.utils
  r-rappdirs
  r-rbowtie2
  r-rcolorbrewer
  r-regioner
  r-reshape2
  r-rlang
  r-rsamtools
  r-s4vectors
  r-scales
  r-shortread
  r-stringr
  r-summarizedexperiment
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-zoo
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1f8b634ffdbbfc0c0064f3429873d7f4714cc31ebc92c357044bb3d6c6d210ec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
