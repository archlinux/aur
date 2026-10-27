# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOquery
_pkgver=2.80.1
pkgname=r-${_pkgname,,}
pkgver=2.80.1
pkgrel=1
pkgdesc='Get data from NCBI Gene Expression Omnibus (GEO)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-curl
  r-data.table
  r-dplyr
  r-limma
  r-magrittr
  r-r.utils
  r-readr
  r-tidyr
  r-xml2
  r-rentrez
  r-summarizedexperiment
  r-s4vectors
  r-rvest
  r-httr2
)
optdepends=(
  r-biocgenerics
  r-covr
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0b7d063cdd9cf684e37cf2dd2c77a3b493336239efae4ef77cbe453693e9f13a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
