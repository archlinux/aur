# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MesKit
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='A tool kit for dissecting cancer evolution from multi-region derived tumor biopsies via somatic alterations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-ape
  r-biostrings
  r-circlize
  r-complexheatmap
  r-cowplot
  r-data.table
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-ggridges
  r-iranges
  r-mclust
  r-phangorn
  r-pracma
  r-rcolorbrewer
  r-s4vectors
  r-tidyr
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-clusterprofiler
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-shiny
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cc8aaf950643ba856ac6277c030651ae62f52061ac52f4c8af4b59d0479c7a18')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
