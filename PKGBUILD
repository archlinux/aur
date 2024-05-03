# system requirements: libxml2: libxml2-dev (deb), libxml2-devel (rpm)libcurl: libcurl4-openssl-dev (deb), libcurl-devel (rpm)openssl: libssl-dev (deb), openssl-devel (rpm), libssl_dev(csw), openssl@1.1 (brew)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=crossmeta
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Cross Platform Meta-Analysis of Microarray Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  curl
  libxml2
  openssh
  r
  r-affxparser
  r-affy
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocmanager
  r-data.table
  r-dbi
  r-dt
  r-edger
  r-fdrtool
  r-geoquery
  r-limma
  r-matrixstats
  r-metama
  r-miniui
  r-oligo
  r-rcurl
  r-reader
  r-readxl
  r-rsqlite
  r-shiny
  r-shinybs
  r-shinyjs
  r-shinypanel
  r-shinywidgets
  r-stringr
  r-sva
  r-tibble
  r-xml
)
optdepends=(
  r-knitr
  r-lydata
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ca19a9fabcb6075aecb7648365954f4844e0402991dee81b8577d01cfc720fbe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
