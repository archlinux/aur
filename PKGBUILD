# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=zFPKM
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='A suite of functions to facilitate zFPKM transformations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-checkmate
  r-dplyr
  r-ggplot2
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-edger
  r-geoquery
  r-knitr
  r-limma
  r-printr
  r-rmarkdown
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('51d62045cede92b2a08c713c566b3fa1279b34c6bea1ab6b9db5ac974729efc0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
