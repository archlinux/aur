# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RankProd
_pkgver=3.38.0
pkgname=r-${_pkgname,,}
pkgver=3.38.0
pkgrel=1
pkgdesc='Rank Product method for identifying differentially expressed genes with application in meta-analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-gmp
  r-rmpfr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7456d5522d2ab5d830f3381816dbf85f689225f255d4cb3ad67d97bec63c408b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
