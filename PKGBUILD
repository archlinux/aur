# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gprofiler2
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=0.2.1
pkgrel=4
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
sha256sums=('2fac15b65921d95b1d360ad3f60bf9c077ab806dd69702736aeff73216191064')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
