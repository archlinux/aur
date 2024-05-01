# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RankProd
_pkgver=3.30.0
pkgname=r-${_pkgname,,}
pkgver=3.30.0
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
sha256sums=('10176a783558144a7adac309f803cad3e0f34a0f671dca4422840efbc7402c79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
