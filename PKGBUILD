# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOexpress
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Visualise microarray and RNAseq data using gene ontology annotations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biomart
  r-ggplot2
  r-gplots
  r-randomforest
  r-rcolorbrewer
  r-rcurl
  r-stringr
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aecf5f8bb9cfce7e7af9d377a11d366ce0d43f021eff74b8b4c92d722b0ce043')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
