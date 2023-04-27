# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PCAtools
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='PCAtools: Everything Principal Components Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-beachmat
  r-bh
  r-biocparallel
  r-biocsingular
  r-cowplot
  r-delayedarray
  r-delayedmatrixstats
  r-dqrng
  r-ggplot2
  r-ggrepel
  r-rcpp
  r-reshape2
  gcc
)
optdepends=(
  r-airway
  r-beachmat
  r-biobase
  r-biocgenerics
  r-deseq2
  r-geoquery
  r-ggalt
  r-ggplotify
  r-hgu133a.db
  r-knitr
  r-magrittr
  r-org.hs.eg.db
  r-rmarkdown
  r-rmtstat
  r-scran
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('253d34478152bb759ac67e14ae003a1e435af8c855ac08c983d39ef6853e741e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
