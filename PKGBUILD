# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pogos
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
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
sha256sums=('6395e731b80758ab1023c8ade62f6ede929d723731859c5a17ad3e16cbafacc4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
