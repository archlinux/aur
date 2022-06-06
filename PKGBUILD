# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HEM
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=1.68.0
pkgrel=1
pkgdesc='Heterogeneous error model for identification of differentially expressed genes under multiple conditions'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('981b300fb2b5baec61aca4eaa5c1de5b98724633807d13ab233ad22c738a06c3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
