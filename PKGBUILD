# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Ularcirc
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Shiny app for canonical and back splicing analysis (i.e. circular and mRNA analysis)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-data.table
  r-dt
  r-genomeinfodb
  r-genomeinfodbdata
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-gsubfn
  r-mirbase.db
  r-moments
  r-organism.dplyr
  r-s4vectors
  r-shiny
  r-shinydashboard
  r-shinyfiles
  r-shinyjs
  r-sushi
  r-yaml
  r-plotgardener
  r-r.utils
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-httpuv
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('10bd03b900e73956c5f9b3b05f1bc2e6fa47a86fb99088ce7c24b55d06b7115f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
