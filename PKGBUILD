# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNeXML
_pkgver=2.4.8
pkgname=r-${_pkgname,,}
pkgver=2.4.8
pkgrel=1
pkgdesc="Semantically Rich I/O for the 'NeXML' Format"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  r-ape
  r-dplyr
  r-httr
  r-lazyeval
  r-plyr
  r-reshape2
  r-stringi
  r-stringr
  r-tidyr
  r-uuid
  r-xml
  r-xml2
)
optdepends=(
  r-covr
  r-geiger
  r-knitcitations
  r-knitr
  r-phytools
  r-rdflib
  r-rfigshare
  r-rlang
  r-rmarkdown
  r-spelling
  r-taxadb
  r-testthat
  r-xslt
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('26d429f95afe2e24d79eb7b0d3eeec4068e7d33b715abb8f48f380e0ccbbb850')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
