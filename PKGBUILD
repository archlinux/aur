# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DeMixT
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Cell type-specific deconvolution of heterogeneous tumor samples with two or three components using expression data from RNAseq or microarray platforms'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-base64enc
  r-ggplot2
  r-knitr
  r-matrixcalc
  r-matrixstats
  r-rcpp
  r-rmarkdown
  r-summarizedexperiment
  r-truncdist
  r-dss
  r-dendextend
  r-psych
  r-sva
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dadab947a93646cfc2341930e679de054a9711a63b06769139d053575b54cac2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
