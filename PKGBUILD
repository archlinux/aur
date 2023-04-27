# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RDRToolbox
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='A package for nonlinear dimension reduction with Isomap and LLE.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-rgl
)
optdepends=(
  r-golubesets
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e51afe41e910584ef9f4cd1325ee13422d60d844ce6a1a3cf41a66d5aa59eae8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
