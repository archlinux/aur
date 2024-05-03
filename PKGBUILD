# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Ularcirc
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
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
  r-plotgardener
  r-r.utils
  r-s4vectors
  r-shiny
  r-shinydashboard
  r-shinyfiles
  r-shinyjs
  r-yaml
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
sha256sums=('97ecc618d4dcdca631b44bca6e4d2d1ab7ff08f4b5c2e1304b3bb5371edff363')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
