# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gprofiler2
_pkgver=0.2.2
pkgname=r-${_pkgname,,}
pkgver=0.2.2
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
sha256sums=('b90094f8de25c2953fc14839ac2461d94012bcbf445ff06fdc46624cd6dd6efd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
