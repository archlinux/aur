# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ALPS
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=6
pkgdesc='AnaLysis routines for ePigenomicS data'
arch=('any')
url="https://bioconductor.org/packages/3.14/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-biocparallel
  r-chipseeker
  r-corrplot
  r-data.table
  r-dplyr
  r-genefilter
  r-genomicranges
  r-ggally
  r-gghalves
  r-ggplot2
  r-ggseqlogo
  r-gviz
  r-magrittr
  r-org.hs.eg.db
  r-plyr
  r-reshape2
  r-rtracklayer
  r-stringr
  r-tibble
  r-tidyr
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
optdepends=(
  r-rmarkdown
  r-knitr
  r-complexheatmap
  r-circlize
  r-testthat
)
makedepends=(
  git
  tar
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

