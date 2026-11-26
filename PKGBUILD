# system requirements: mailsend-go
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocPkgTools
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
  r-curl
  r-dplyr
  r-dt
  r-gh
  r-glue
  r-graph
  r-htmltools
  r-htmlwidgets
  r-httr
  r-httr2
  r-igraph
  r-jsonlite
  r-lubridate
  r-purrr
  r-rbgl
  r-readr
  r-rlang
  r-rvest
  r-stringr
  r-tibble
  r-tidyr
  r-xml2
  r-yaml
)
optdepends=(
  r-biocstyle
  r-blastula
  r-clipr
  r-diagrammer
  r-kableextra
  r-knitr
  r-networkd3
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
  r-tm
  r-visnetwork
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('237b79575381e2c4a67d909d0b020e279c652017858b17b7973d4a6267b61885')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
