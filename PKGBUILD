# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TFutils
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='TFutils'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocfilecache
  r-dplyr
  r-dt
  r-gseabase
  r-httr
  r-magrittr
  r-miniui
  r-org.hs.eg.db
  r-readxl
  r-rjson
  r-rsamtools
  r-shiny
)
optdepends=(
  r-annotationfilter
  r-biobase
  r-biocparallel
  r-biocstyle
  r-data.table
  r-ensdb.hsapiens.v75
  r-genomeinfodb
  r-genomicfeatures
  r-genomicfiles
  r-genomicranges
  r-ggplot2
  r-go.db
  r-gviz
  r-gwascat
  r-iranges
  r-knitr
  r-motifdb
  r-motifstack
  r-png
  r-rcolorbrewer
  r-rmarkdown
  r-s4vectors
  r-summarizedexperiment
  r-testthat
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bb7d2afdc91813e12127352866fc094688ea9c612c0ad9b52ea787019c3fb3d7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
