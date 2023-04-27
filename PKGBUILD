# system requirements: 4GB of RAM
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HPAStainR
_pkgver=1.9.0
pkgname=r-${_pkgname,,}
pkgver=1.9.0
pkgrel=1
pkgdesc='Queries the Human Protein Atlas Staining Data for Multiple Proteins and Genes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-data.table
  r-dplyr
  r-scales
  r-shiny
  r-stringr
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocmanager
  r-hpar
  r-knitr
  r-qpdf
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('093478b025c829e365db8b1f9496cf9f6650bc883f932d8c708808d447d45eae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
