# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lipidr
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=2.18.0
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
  r-knitr
  r-plotly
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6266d0c8fc0e9fbef244f33a9c5dcadf881f99edc5c7e2da0809c01159f2fd0c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
