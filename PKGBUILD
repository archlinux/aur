# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pogos
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='PharmacOGenomics Ontology Support'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  r-httr
  r-ontoproc
  r-rjson
  r-s4vectors
  r-shiny
)
optdepends=(
  r-biocstyle
  r-dt
  r-knitr
  r-ontologyplot
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('82e6eb73af5dc3c842d33bd160bc6173d46b47e317c0b511d13909f149f00244')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
