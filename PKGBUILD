# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrayQuality
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=1.86.0
pkgrel=1
pkgdesc='Assessing array quality on spotted arrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-gridbase
  r-hexbin
  r-limma
  r-marray
  r-rcolorbrewer
)
optdepends=(
  r-heebodata
  r-mclust
  r-meebodata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f3a9081cdb2e9cb14987bfa477c9407502f0ac0fbbc8176b954d4b0f3c4c1b27')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
