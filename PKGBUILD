# system requirements: mailsend-go
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocPkgTools
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Collection of simple tools for learning about Bioc Packages'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocfilecache
  r-biocmanager
  r-biocviews
  r-dplyr
  r-dt
  r-gh
  r-graph
  r-htmltools
  r-htmlwidgets
  r-httr
  r-igraph
  r-jsonlite
  r-magrittr
  r-rbgl
  r-readr
  r-rlang
  r-rorcid
  r-rvest
  r-stringr
  r-tibble
  r-xml2
)
optdepends=(
  r-biocstyle
  r-blastula
  r-clipr
  r-diagrammer
  r-kableextra
  r-knitr
  r-lubridate
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
  r-tm
  r-visnetwork
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('048b35c9f9727055b5a9d476a8f24fa5ecea128720d52a4740a79f8ae1620a34')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
