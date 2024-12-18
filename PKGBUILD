# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=iSEEhex
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='iSEE extension for summarising data points in hexagonal bins'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  r-hexbin
  r-isee
  r-shiny
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-refmanager
  r-rmarkdown
  r-scater
  r-scrnaseq
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('acf0caf10049b39269551646f8e36b614e6020a5b74b2a28f67848b10a1c8087')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
