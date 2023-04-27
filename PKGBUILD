# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KOdata
_pkgver=1.25.0
pkgname=r-${_pkgname,,}
pkgver=1.25.0
pkgrel=1
pkgdesc='LINCS Knock-Out Data Package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('db69e600f37a4e232d37a01ce1222620f49a1e5f6b7e7760f5cb195a0073f0ea')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
