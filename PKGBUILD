# system requirements: JAGS 4.x.y
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=infercnv
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Infer Copy Number Variation from Single-Cell RNA-Seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-ape
  r-argparse
  r-biocgenerics
  r-catools
  r-coda
  r-coin
  r-digest
  r-doparallel
  r-dplyr
  r-edger
  r-fastcluster
  r-fitdistrplus
  r-foreach
  r-futile.logger
  r-future
  r-ggplot2
  r-gplots
  r-gridextra
  r-hiddenmarkov
  r-igraph
  r-paralleldist
  r-phyclust
  r-rann
  r-rcolorbrewer
  r-reshape2
  r-rjags
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cd7baf7107beee52484e70abc6a48edb09ec877f734226131336adffb14b28ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
