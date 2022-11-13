# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=iSEEhex
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
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
sha256sums=('3c4dcfbaf29c3ff0a0c8ec57b935321b499bcbe49cca39328d53bc1c8ea6c91a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
