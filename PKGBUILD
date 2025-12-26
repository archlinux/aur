# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CoCiteStats
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=1.82.0
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
sha256sums=('f1922203ea3d8f7106b0336a2ad8632aaa75896da52cce268a4825241eac5f83')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
