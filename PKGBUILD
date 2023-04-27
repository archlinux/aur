# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iSEEu
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='iSEE Universe'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-colourpicker
  r-dt
  r-ggplot2
  r-iranges
  r-isee
  r-iseehex
  r-s4vectors
  r-shiny
  r-shinyace
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-airway
  r-annotationdbi
  r-biocstyle
  r-covr
  r-edger
  r-go.db
  r-htmltools
  r-igraph
  r-keggrest
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-rtsne
  r-scater
  r-scran
  r-scrnaseq
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('82717131109785b06fe5fde76fcef08ff11eea9bc9c80d7e98de81904ee23cc5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
