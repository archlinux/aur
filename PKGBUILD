# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=conclus
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=1.5.0
pkgrel=4
pkgdesc='ScRNA-seq Workflow CONCLUS - From CONsensus CLUSters To A Meaningful CONCLUSion'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocfilecache
  r-biomart
  r-clusterprofiler
  r-dbscan
  r-doparallel
  r-dplyr
  r-factoextra
  r-foreach
  r-fpc
  r-geoquery
  r-ggplot2
  r-gridextra
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pheatmap
  r-rlang
  r-rtsne
  r-scales
  r-scater
  r-scran
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-dynamictreecut
  r-knitr
  r-matrixstats
  r-rmarkdown
  r-s4vectors
  r-testthat
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4c9aa76ae7b27d7d50320f5e2069a739acbf7097c7d803f0075e77dcf5383327')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
