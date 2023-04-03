# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uncoverappLib
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=1.8.1
pkgrel=1
pkgdesc='Interactive graphical application for clinical assessment of sequence coverage at the base-pair level'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocfilecache
  r-condformat
  r-dt
  r-ensdb.hsapiens.v75
  r-ensdb.hsapiens.v86
  r-genomicranges
  r-gviz
  r-homo.sapiens
  r-markdown
  r-openxlsx
  r-org.hs.eg.db
  r-organismdbi
  r-processx
  r-rappdirs
  r-rlist
  r-rsamtools
  r-s4vectors
  r-shiny
  r-shinybs
  r-shinycssloaders
  r-shinyjs
  r-shinywidgets
  r-stringr
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('755acd7d26d88c77ea86f7e8b7fc67143f9cda3ed97bfc96b5a6d164aae1dda4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
