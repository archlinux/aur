# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NewWave
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
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
sha256sums=('885130e41be5e26a4194e661a4cf8224d6c5ab6fd68bd3cc85b226f871b1fc8f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
