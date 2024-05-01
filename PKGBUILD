# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioQC
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Detect tissue heterogeneity in expression profiles with gene sets'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-edger
  r-rcpp
)
optdepends=(
  r-covr
  r-ggplot2
  r-gplots
  r-gridextra
  r-hgu133plus2.db
  r-ineq
  r-knitr
  r-lattice
  r-latticeextra
  r-limma
  r-org.hs.eg.db
  r-plyr
  r-rbenchmark
  r-rcolorbrewer
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('730f12f773b744d0db1cf1b94e3f7fe04d6f11f1c45dbabf492527ca8bc3d993')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
