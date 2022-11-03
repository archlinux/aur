# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnVIL
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Bioconductor on the AnVIL compute environment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocmanager
  r-dplyr
  r-futile.logger
  r-httr
  r-jsonlite
  r-rapiclient
  r-rlang
  r-tibble
  r-tidyr
  r-tidyselect
  r-vctrs
  r-shiny
  r-dt
  r-miniui
  r-htmltools
)
optdepends=(
  r-biocstyle
  r-knitr
  r-parallel
  r-readr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6cbd38db1067ceb0b01611bac33697c8c0db07dbb54cb215bd53ea71c9832d59')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
