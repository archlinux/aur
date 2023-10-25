# system requirements: gsl. Note: users should have GSL installed. Windowsusers: 'consult the README file available in the inst directoryof the source distribution for necessary configurationinstructions'.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GLAD
_pkgver=2.66.0
pkgname=r-${_pkgname,,}
pkgver=2.66.0
pkgrel=1
pkgdesc='Gain and Loss Analysis of DNA'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-aws
  gsl
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a14c769b423fb99d744d95948f33b7e8ed0dd23d40e25188d2e767668afd9e13')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
