# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sigPathway
_pkgver=1.66.1
pkgname=r-${_pkgname,,}
pkgver=1.66.1
pkgrel=1
pkgdesc='Pathway Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-annotationdbi
  r-hgu133a.db
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0b00cf3090fec13b3b849e2484c9a33d0538f0483dee42348d81cbca3fb1c1d2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
