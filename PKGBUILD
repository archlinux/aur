# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSnbase
_pkgver=2.24.2
pkgname=r-${_pkgname,,}
pkgver=2.24.2
pkgrel=1
pkgdesc='Base Functions and Classes for Mass Spectrometry and Proteomics'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-affy
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-digest
  r-ggplot2
  r-impute
  r-iranges
  r-maldiquant
  r-mscoreutils
  r-mzid
  r-mzr
  r-pcamethods
  r-plyr
  r-protgenerics
  r-rcpp
  r-s4vectors
  r-scales
  r-vsn
  r-xml
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-gplots
  r-gridextra
  r-imputelcmd
  r-knitr
  r-magrittr
  r-microbenchmark
  r-msdata
  r-norm
  r-proloc
  r-prolocdata
  r-pryr
  r-rdisop
  r-rgl
  r-rmarkdown
  r-rols
  r-roxygen2
  r-rpx
  r-shiny
  r-summarizedexperiment
  r-testthat
  r-zoo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8727e255ae4f10e772935a720118f3b97d674e8d2f6f185d871e270b7320b849')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
