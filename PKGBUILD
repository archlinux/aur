# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RmiR.Hs.miRNA
_pkgver=1.0.7
pkgname=r-${_pkgname,,}
pkgver=1.0.7
pkgrel=4
pkgdesc='Various databases of microRNA Targets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
)
optdepends=(
  r-hgug4112a.db
  r-methods
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('649da235d09f1c8d8cbb0a84bce7085f70ac945b80410bf9d4d9d18a40e2cb5f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
