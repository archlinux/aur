# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=depmap
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Cancer Dependency Map Data Package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationhub
  r-dplyr
  r-experimenthub
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-gridextra
  r-knitr
  r-readr
  r-rmarkdown
  r-stringr
  r-tibble
  r-tidyr
  r-viridis
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1b0e67906bf6fb74cb146230004eb6f44113782093655011b69e1c6676d1c183')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
