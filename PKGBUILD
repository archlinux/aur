# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PureCN
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
pkgrel=1
pkgdesc='Copy number calling and SNV classification using targeted short read sequencing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biostrings
  r-data.table
  r-dnacopy
  r-futile.logger
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-iranges
  r-mclust
  r-rcolorbrewer
  r-rhdf5
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-variantannotation
  r-vgam
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-copynumber
  r-covr
  r-genomicsdb
  r-jsonlite
  r-knitr
  r-markdown
  r-optparse
  r-org.hs.eg.db
  r-pscbs
  r-r.utils
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('17aa02f351e87c72b26af7e5b3c39171c8cd05954721243434411a969392acc0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
