# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=conclus
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=1.3.3
pkgrel=1
pkgdesc='ScRNA-seq Workflow CONCLUS - From CONsensus CLUSters To A Meaningful CONCLUSion'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
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
  r-pheatmap
  r-rtsne
  r-scales
  r-scater
  r-scran
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-org.mm.eg.db
  r-org.hs.eg.db
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
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('469178ed2a313a6f39fd8306b4470601b691edbcd0acfd896d4019c7c304f9d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
