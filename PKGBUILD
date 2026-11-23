# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DeMixT
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=2.0.0
pkgrel=1
pkgdesc='Cell type-specific deconvolution of heterogeneous tumor samples with two or three components using expression data from RNAseq or microarray platforms'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-base64enc
  r-ggplot2
  r-matrixcalc
  r-matrixstats
  r-rcpp
  r-summarizedexperiment
  r-truncdist
  r-dendextend
  r-psych
  r-sva
  r-fitdistrplus
  r-magrittr
  r-pbapply
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-calibrate
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c228591f7973cb1cb2463bd381201891f43df3eb5f855101d81403e24e4fe924')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
