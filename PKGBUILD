# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=depmap
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=1.15.0
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
sha256sums=('c784e96d7ddccc15efb7da84abe96dc5162e24b116036b5e5466b3ba91e4fd89')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
