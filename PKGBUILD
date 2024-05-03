# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterProfiler
_pkgver=4.12.0
pkgname=r-${_pkgname,,}
pkgver=4.12.0
pkgrel=1
pkgdesc='A universal enrichment tool for interpreting omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-dose
  r-downloader
  r-dplyr
  r-enrichplot
  r-go.db
  r-gosemsim
  r-gson
  r-httr
  r-igraph
  r-magrittr
  r-plyr
  r-qvalue
  r-rlang
  r-tidyr
  r-yulab.utils
)
optdepends=(
  r-annotationhub
  r-biocmanager
  r-jsonlite
  r-knitr
  r-org.hs.eg.db
  r-prettydoc
  r-readr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1f5aef1116f9767e3a76a820e19563e616bc33b62fd1371e7a352864495eae72')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
