# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=condformat
_pkgver=0.10.0
pkgname=r-${_pkgname,,}
pkgver=0.10.0
pkgrel=3
pkgdesc='Conditional Formatting in Data Frames'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  r-dplyr
  r-gridextra
  r-gtable
  r-htmltable
  r-htmltools
  r-knitr
  r-magrittr
  r-openxlsx
  r-rlang
  r-rmarkdown
  r-scales
  r-tibble
  r-tidyselect
)
optdepends=(
  r-promises
  r-shiny
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('26cfee9646af7d1ff1dbcf667359467133cef249d411b8247933f5f2197cdbc7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
