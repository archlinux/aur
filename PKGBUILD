# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=artMS
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Analytical R tools for Mass Spectrometry'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-bit64
  r-circlize
  r-corrplot
  r-data.table
  r-dplyr
  r-getopt
  r-ggdendro
  r-ggplot2
  r-ggrepel
  r-gplots
  r-limma
  r-msstats
  r-openxlsx
  r-org.hs.eg.db
  r-pheatmap
  r-plotly
  r-plyr
  r-rcolorbrewer
  r-scales
  r-seqinr
  r-stringr
  r-tidyr
  r-upsetr
  r-venndiagram
  r-yaml
)
optdepends=(
  r-biocstyle
  r-complexheatmap
  r-factoextra
  r-factominer
  r-gprofiler
  r-knitr
  r-org.mm.eg.db
  r-performanceanalytics
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('79917c85fd7dab02d01539f11b430ade25fa85ff4f71679fd94251c0061cd9c8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
