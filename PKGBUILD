# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NewWave
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Negative binomial model for scRNA-seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocsingular
  r-delayedarray
  r-irlba
  r-sharedobject
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-mclust
  r-rcpp
  r-rmarkdown
  r-rtsne
  r-splatter
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('92f3ff5a9260194019f1f0f78e068b66fc8e42ad7ff1a7ab890b0bc3e332fef9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
