# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ScaledMatrix
_pkgver=1.7.1
pkgname=r-${_pkgname,,}
pkgver=1.7.1
pkgrel=1
pkgdesc='Creating a DelayedMatrix of Scaled and Centered Values'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-delayedarray
  r-s4vectors
)
optdepends=(
  r-biocsingular
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('af82a8858630315dc7565c3e3607e58709848a788320cd05d09e64f7b6c783d0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
