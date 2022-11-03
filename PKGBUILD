# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pogos
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
  r-dt
  r-knitr
  r-ontologyplot
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('213de2c941f662a26e2a818c973b42f5a235821257245baa41ba12bf08b7e48b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
