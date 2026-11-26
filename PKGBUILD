# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=planet
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Placental DNA methylation analysis tools'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-magrittr
  r-tibble
)
optdepends=(
  r-epidish
  r-ggplot2
  r-knitr
  r-minfi
  r-rmarkdown
  r-scales
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d1e89d4580876bde5a4df73b60bbd7064fcb05f983ab08b6a85bd753afc2c203')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
