# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bioCancer
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Interactive Multi-Omics Cancers Data Visualization and Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-algdesign
  r-annotationdbi
  r-biobase
  r-clusterprofiler
  r-diagrammer
  r-dose
  r-dplyr
  r-dt
  r-genetclassifier
  r-go.db
  r-htmlwidgets
  r-httr
  r-import
  r-org.bt.eg.db
  r-org.hs.eg.db
  r-plyr
  r-r.methodss3
  r-r.oo
  r-radiant.data
  r-reactome.db
  r-reactomepa
  r-shiny
  r-shinythemes
  r-tibble
  r-visnetwork
  r-xml
)
optdepends=(
  r-biocstyle
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f5274c3303f18f68740be7c701b37ff174f078e5b62414526fc65a54c71c1b66')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
