# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maanova
_pkgver=1.68.2
pkgname=r-${_pkgname,,}
pkgver=1.68.2
pkgrel=1
pkgdesc='Tools for analyzing Micro Array experiments'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
)
optdepends=(
  r-qvalue
  r-rmpi
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a92f70a01c292bc617228ac55b6e0170e55d2d323eefd124d77a6eb6c1de9de5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
