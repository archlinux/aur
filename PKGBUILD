# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RegEnrich
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Gene regulator enrichment analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biocset
  r-deseq2
  r-dose
  r-dplyr
  r-fgsea
  r-ggplot2
  r-limma
  r-magrittr
  r-randomforest
  r-reshape2
  r-s4vectors
  r-summarizedexperiment
  r-tibble
  r-wgcna
)
optdepends=(
  r-biocmanager
  r-geoquery
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a4f5af1607bebfb07ba0f95a8fa204c859e2b5e2cdde217665f334fd8f645a5e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
