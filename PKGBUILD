# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GAPGOM
_pkgver=1.11.0
pkgname=r-${_pkgname,,}
pkgver=1.11.0
pkgrel=4
pkgdesc='GAPGOM (novel Gene Annotation Prediction and other GO Metrics)'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocfilecache
  r-data.table
  r-dplyr
  r-fastmatch
  r-geoquery
  r-go.db
  r-gosemsim
  r-graph
  r-igraph
  r-magrittr
  r-matrixstats
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-plyr
  r-rbgl
)
optdepends=(
  r-ggplot2
  r-kableextra
  r-knitr
  r-org.ag.eg.db
  r-org.at.tair.db
  r-org.bt.eg.db
  r-org.ce.eg.db
  r-org.cf.eg.db
  r-org.dm.eg.db
  r-org.dr.eg.db
  r-org.eck12.eg.db
  r-org.ecsakai.eg.db
  r-org.gg.eg.db
  r-org.mmu.eg.db
  r-org.pf.plasmo.db
  r-org.pt.eg.db
  r-org.rn.eg.db
  r-org.sc.sgd.db
  r-org.ss.eg.db
  r-org.xl.eg.db
  r-prettydoc
  r-profvis
  r-pryr
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('df7826b3bc9a7e5063d6b70e4de3ba5d5ddddff6d82bce56cbed93fe0b3f896a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
