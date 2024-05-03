# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SigCheck
_pkgver=2.36.0
pkgname=r-${_pkgname,,}
pkgver=2.36.0
pkgrel=1
pkgdesc="Check a gene signature's prognostic performance against random signatures, known signatures, and permuted data/metadata"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocparallel
  r-e1071
  r-mlinterfaces
)
optdepends=(
  r-biocstyle
  r-breastcancernki
  r-qusage
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2df8051a6f6ae93a96b0212798f05744ecfd5612c12c85612fc1c01ab698dbae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
