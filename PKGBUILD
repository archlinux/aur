# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MicrobiomeProfiler
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='An R/shiny package for microbiome functional enrichment analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-clusterprofiler
  r-config
  r-dt
  r-enrichplot
  r-ggplot2
  r-golem
  r-htmltools
  r-magrittr
  r-shiny
  r-shinycustomloader
  r-shinywidgets
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8908b675eaec3d7066e257c2c936e4647efd648f14fb22e1eca12f4c038af433')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
