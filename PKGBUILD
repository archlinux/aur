# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PREDA
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Position Related Data Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotate
  r-biobase
  r-lokern
  r-multtest
)
optdepends=(
  r-affy
  r-catools
  r-limma
  r-predasampledata
  r-quantsmooth
  r-qvalue
  r-rmpi
  r-rsprng
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0fabad5239a683e41d522cc6b7a0ec6879379e14d1db42c2b01e8e7e4a437483')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
