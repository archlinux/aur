# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=powerTCR
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Model-Based Comparative Analysis of the TCR Repertoire'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-cubature
  r-doparallel
  r-evmix
  r-foreach
  r-magrittr
  r-purrr
  r-truncdist
  r-vegan
  r-vgam
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c6bdc3b61df9667961ca0d3b628a33c4a9628060691f3e985ed1119cfa30b3f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
