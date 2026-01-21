# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reactome.db
_pkgver=1.95.0
pkgname=r-${_pkgname,,}
pkgver=1.95.0
pkgrel=1
pkgdesc='A set of annotation maps for reactome'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-annotationdbi
)
optdepends=(
  r-rsqlite
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e6b95a88530ba15a993c4d5c296983eee73ab51adc95e6e551b8b242b25f07ad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
