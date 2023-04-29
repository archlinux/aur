# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BrainSABER
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=4
pkgdesc='Brain Span Atlas in Biobase Expressionset R toolset'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocfilecache
  r-biomart
  r-data.table
  r-lsa
  r-s4vectors
  r-shiny
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-complexheatmap
  r-fastcluster
  r-heatmaply
  r-knitr
  r-plotly
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4d1a2faefcff5e4835032f0e63c38a908da864bd8235b80e1af79e1bd596acdb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
