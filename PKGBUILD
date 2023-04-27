# system requirements: xml2, GNU make, C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CytoML
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='A GatingML Interface for Cross Platform Cytometry Data Sharing'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  gcc
  libxml2
  make
  r
  r-bh
  r-biobase
  r-cpp11
  r-cytolib
  r-data.table
  r-dplyr
  r-flowcore
  r-flowworkspace
  r-ggcyto
  r-graph
  r-jsonlite
  r-opencyto
  r-rbgl
  r-rgraphviz
  r-rhdf5lib
  r-rprotobuflib
  r-tibble
  r-xml
  r-yaml
)
optdepends=(
  r-flowworkspacedata
  r-knitr
  r-parallel
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6e03532826526949599a15f615472c9c7f4577c51772a2ea2e4088694b7834a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
