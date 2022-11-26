# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hca
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=3
pkgdesc='Exploring the Human Cell Atlas Data Coordinating Platform'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocfilecache
  r-digest
  r-dplyr
  r-httr
  r-jsonlite
  r-readr
  r-tibble
  r-tidyr
  r-shiny
  r-miniui
  r-dt
)
optdepends=(
  r-biocstyle
  r-knitr
  r-loomexperiment
  r-methods
  r-rmarkdown
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ece84ea76904bd925c2edebfd2d0e7942b7aeb5d105f0b7a834024c23ccd40fc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
