# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TEQC
_pkgver=4.28.0
pkgname=r-${_pkgname,,}
pkgver=4.28.0
pkgrel=1
pkgdesc='Quality control for target capture experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-hwriter
  r-iranges
  r-rsamtools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a29377227fa8a9bdbef311823ba69031a2acd2a2c0b0b6825aebc25445854500')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
