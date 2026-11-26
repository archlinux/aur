# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ConsensusClusterPlus
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=1.78.0
pkgrel=1
pkgdesc='ConsensusClusterPlus'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-all
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d2a7973a0e1f295088266e1fc2dff07874cf02bbafcb5d0bcac3eedb8f484495')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
