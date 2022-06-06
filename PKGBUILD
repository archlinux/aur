# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PFAM.db
_pkgver=3.15.0
pkgname=r-${_pkgname,,}
pkgver=3.15.0
pkgrel=3
pkgdesc='A set of protein ID mappings for PFAM'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
)
optdepends=(
  r-dbi
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e7036a5f76779ab6e8a32eb659c54f52426c4824dee02903cffd85bed372720f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
