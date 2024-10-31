# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cyanoFilter
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Phytoplankton Population Identification using Cell Pigmentation and/or Complexity'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-cytometree
  r-flowclust
  r-flowcore
  r-flowdensity
  r-ggally
  r-ggplot2
  r-mrfdepth
)
optdepends=(
  r-dplyr
  r-knitr
  r-magrittr
  r-purrr
  r-rmarkdown
  r-stringr
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('623f2af2667dc404ffb418a2a5a90c4332df2154c2bc6dfc34b24397c3e48ed6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
