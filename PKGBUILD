# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Clonality
_pkgver=1.47.0
pkgname=r-${_pkgname,,}
pkgver=1.47.0
pkgrel=1
pkgdesc='Clonality testing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dnacopy
)
optdepends=(
  r-gdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3939b79757af778eae9891dfe2a8e9d8fc626cabb22e90ffbe350eaa01e3bc7b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
