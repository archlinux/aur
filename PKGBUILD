# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOquery
_pkgver=2.74.0
pkgname=r-${_pkgname,,}
pkgver=2.74.0
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
sha256sums=('d4fe4e43496726eda6f64ec17b0af2228925639fbd16cb562acdbe4f3b439153')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
