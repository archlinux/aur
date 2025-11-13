# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ScaledMatrix
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
  r-delayedmatrixstats
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2f1d919eddc61652f306eb4cb73500e411d4255a1eb4d29e448a7337bfc6ebaf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
