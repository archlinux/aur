# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnVIL
_pkgver=1.12.3
pkgname=r-${_pkgname,,}
pkgver=1.12.3
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
sha256sums=('30ae9f3d9ecb83afc26be36aeb01dac0c962b727dfb9c12d9a9a19c8d803a137')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
