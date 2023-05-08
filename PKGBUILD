# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OUTRIDER
_pkgver=1.18.1
pkgname=r-${_pkgname,,}
pkgver=1.18.1
pkgrel=1
pkgdesc='OUTRIDER - OUTlier in RNA-Seq fInDER'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-bbmisc
  r-biocgenerics
  r-biocparallel
  r-data.table
  r-deseq2
  r-generics
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-heatmaply
  r-iranges
  r-matrixstats
  r-pcamethods
  r-pheatmap
  r-plotly
  r-plyr
  r-prroc
  r-rcolorbrewer
  r-rcpp
  r-rcpparmadillo
  r-reshape2
  r-s4vectors
  r-scales
  r-summarizedexperiment
)
optdepends=(
  r-annotationdbi
  r-beeswarm
  r-biocstyle
  r-covr
  r-knitr
  r-org.hs.eg.db
  r-rmariadb
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b1aa0a56b11f3151cbe60ac5828d5f924aecddee5d5345d3973dbd77b1beb323')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
