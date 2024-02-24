# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gprofiler2
_pkgver=0.2.3
pkgname=r-${_pkgname,,}
pkgver=0.2.3
pkgrel=1
pkgdesc="Interface to the 'g:Profiler' Toolset"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-crosstalk
  r-dplyr
  r-ggplot2
  r-gridextra
  r-jsonlite
  r-plotly
  r-rcurl
  r-tidyr
  r-viridislite
)
optdepends=(
  r-knitr
  r-prettydoc
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b02ea814a7024aa8f2a01761c964b53f98607df0f7bbf7db3026cf223f7895ce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
