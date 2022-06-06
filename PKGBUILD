# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oneSENSE
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='One-Dimensional Soli-Expression by Nonlinear Stochastic Embedding (OneSENSE)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-flowcore
  r-gplots
  r-plotly
  r-rtsne
  r-scatterplot3d
  r-shiny
  r-shinyfiles
  r-webshot
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2038effb9078322070f97cf743bde8b7ed79f0f94856640606d039faca873fa1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
