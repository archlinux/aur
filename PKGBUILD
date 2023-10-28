# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cosmiq
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='cosmiq - COmbining Single Masses Into Quantities'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-faahko
  r-massspecwavelet
  r-pracma
  r-rcpp
  r-xcms
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e91d9d53931954baaa3dcb31e21bf7e37d570facfbb0cdb0d878d9e023ff2cd7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
