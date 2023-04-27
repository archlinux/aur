# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lipidr
_pkgver=2.13.0
pkgname=r-${_pkgname,,}
pkgver=2.13.0
pkgrel=1
pkgdesc='Data Mining and Analysis of Lipidomics Datasets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-data.table
  r-dplyr
  r-fgsea
  r-forcats
  r-ggplot2
  r-imputelcmd
  r-limma
  r-magrittr
  r-rlang
  r-ropls
  r-s4vectors
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-ggrepel
  r-iheatmapr
  r-knitr
  r-plotly
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3f2090b84bcc78cd6e1426e0d2788f4255913ada6e4ce1ed534cc14244b6d9e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
