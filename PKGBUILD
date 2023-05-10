# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnVIL
_pkgver=1.12.1
pkgname=r-${_pkgname,,}
pkgver=1.12.1
pkgrel=1
pkgdesc='Bioconductor on the AnVIL compute environment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocmanager
  r-dplyr
  r-dt
  r-futile.logger
  r-htmltools
  r-httr
  r-jsonlite
  r-miniui
  r-rapiclient
  r-rlang
  r-shiny
  r-tibble
  r-tidyr
  r-tidyselect
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-parallel
  r-readr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('53e7dbaeefb5232936974ed4dec61dc6805179ff72c08da23fc145616ed4253e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
