# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocOncoTK
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Bioconductor components for general cancer genomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bigrquery
  r-car
  r-complexheatmap
  r-curatedtcgadata
  r-dbi
  r-dplyr
  r-dt
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggpubr
  r-graph
  r-httr
  r-iranges
  r-magrittr
  r-plyr
  r-rgraphviz
  r-rjson
  r-s4vectors
  r-scales
  r-shiny
  r-summarizedexperiment
)
optdepends=(
  r-annotationdbi
  r-biobase
  r-biocfilecache
  r-biocstyle
  r-dbplyr
  r-ensdb.hsapiens.v75
  r-fdb.infiniummethylation.hg19
  r-genomeinfodb
  r-knitr
  r-multiassayexperiment
  r-ontologyplot
  r-ontoproc
  r-org.hs.eg.db
  r-pogos
  r-reshape2
  r-restfulse
  r-rhdf5client
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg18.knowngene
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ce739a7028eb752c0930246d854605ba10ff45019f327f2b26c86e40892a2384')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
