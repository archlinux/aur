# system requirements: libcurl4-openssl-dev, libxml2-dev, libssl-dev,gfortran, build-essential, libz-dev, zlib1g-dev
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CeTF
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Coexpression for Transcription Factors using Regulatory Impact Factors and Partial Correlation and Information Theory analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  curl
  gcc-fortran
  libxml2
  openssl
  r
  zlib
  r-circlize
  r-clusterprofiler
  r-complexheatmap
  r-deseq2
  r-dplyr
  r-genomictools.filehandler
  r-ggally
  r-ggnetwork
  r-ggplot2
  r-ggpubr
  r-ggrepel
  r-igraph
  r-network
  r-rcpp
  r-rcpparmadillo
  r-rcy3
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-airway
  r-kableextra
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b1fffa0b80fb8d7205113f186c7f973979b044a72db009f14dd8f214b405fe6e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
