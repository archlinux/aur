# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AUCell
_pkgver=1.30.1
pkgname=r-${_pkgname,,}
pkgver=1.30.1
pkgrel=1
pkgdesc="AUCell: Analysis of 'gene set' activity in single-cell RNA-seq data (e.g. identify cells with specific gene signatures)"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-data.table
  r-delayedarray
  r-delayedmatrixstats
  r-gseabase
  r-mixtools
  r-r.utils
  r-shiny
  r-summarizedexperiment
)
optdepends=(
  r-biobase
  r-biocstyle
  r-domc
  r-doparallel
  r-dorng
  r-dosnow
  r-dt
  r-dynamictreecut
  r-foreach
  r-geoquery
  r-knitr
  r-nmf
  r-plotly
  r-plyr
  r-r2html
  r-rbokeh
  r-reshape2
  r-rmarkdown
  r-rtsne
  r-testthat
  r-zoo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('023631bdad74a43b166eec2f6bf838ee9fc1b2d48fb0e04765669657e8b17a72')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
