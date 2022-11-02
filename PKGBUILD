# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOquery
_pkgver=2.66.0
pkgname=r-${_pkgname,,}
pkgver=2.66.0
pkgrel=1
pkgdesc='Get data from NCBI Gene Expression Omnibus (GEO)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-data.table
  r-dplyr
  r-httr
  r-limma
  r-magrittr
  r-r.utils
  r-readr
  r-tidyr
  r-xml2
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
sha256sums=('7602d0cb9c8d600187d599c2fb6d7328f219193c72c4af1987aaf51968556232')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
