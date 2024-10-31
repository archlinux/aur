# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=powerTCR
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('a5576f33fc24f0c2d752b6a8f97edcddfb8c3b328cf5a1185325cab900fc7876')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
