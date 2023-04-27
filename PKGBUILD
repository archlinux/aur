# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=compartmap
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Higher-order chromatin domain inference in single cells from scRNA-seq and scATAC-seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocsingular
  r-delayedarray
  r-delayedmatrixstats
  r-genomicranges
  r-ggplot2
  r-hdf5array
  r-raggedexperiment
  r-reshape2
  r-rmtstat
  r-rtracklayer
  r-scales
  r-summarizedexperiment
)
optdepends=(
  r-covr
  r-knitr
  r-markdown
  r-rcpp
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0884a4899707c8a378b5d40ca556a7e268b7dc67d76ae25335c93e56aee56f53')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
