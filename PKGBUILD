# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CoCiteStats
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=1.78.0
pkgrel=1
pkgdesc='Different test statistics based on co-citation.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CPL')
depends=(
  r
  r-annotationdbi
  r-org.hs.eg.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('777e0639efd94bb4111d22a5685f5622e8ac2e09f6e78cd9b6e4ba0b65e55976')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
