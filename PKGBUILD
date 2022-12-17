# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FRASER
_pkgver=1.10.1
pkgname=r-${_pkgname,,}
pkgver=1.10.1
pkgrel=1
pkgdesc='Find RAre Splicing Events in RNA-Seq Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-bbmisc
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biomart
  r-bsgenome
  r-cowplot
  r-data.table
  r-delayedarray
  r-delayedmatrixstats
  r-extradistr
  r-generics
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-hdf5array
  r-iranges
  r-matrixstats
  r-outrider
  r-pcamethods
  r-pheatmap
  r-plotly
  r-prroc
  r-r.utils
  r-rcolorbrewer
  r-rcpp
  r-rcpparmadillo
  r-rhdf5
  r-rsamtools
  r-rsubread
  r-s4vectors
  r-summarizedexperiment
  r-tibble
  r-vgam
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8e766fa7c58a54ef2c76f0915b71107c0308a559ea370a142d1fbfe310ef0f47')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
