# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DExMAdata
_pkgver=1.9.0
pkgname=r-${_pkgname,,}
pkgver=1.9.0
pkgrel=1
pkgdesc='Data package for DExMA package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6dd694da6123021190aaa731e064e8197bf48792434dd9dd360dcb84e7391d68')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
