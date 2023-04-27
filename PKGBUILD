# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CHETAH
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Fast and accurate scRNA-seq cell type identification'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-biodist
  r-corrplot
  r-cowplot
  r-dendextend
  r-ggplot2
  r-pheatmap
  r-plotly
  r-reshape2
  r-s4vectors
  r-shiny
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-matrix
  r-rmarkdown
  r-testthat
  r-vdiffr
)
makedepends=(
  git
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}_${_pkgver}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
