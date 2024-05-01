# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstatsTMT
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='Protein Significance Analysis in shotgun mass spectrometry-based proteomic experiments with tandem mass tag (TMT) labeling'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-checkmate
  r-data.table
  r-ggplot2
  r-limma
  r-lme4
  r-lmertest
  r-msstats
  r-msstatsconvert
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9450b356488536aa10dc8c23e7aa78e1f1689e879f1b1e068e3700d66540b4c8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
