# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KEGGandMetacoreDzPathwaysGEO
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Disease Datasets from GEO'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d95a91633a65335807ebb792dafd9bb4fa09b5a60b5fc67724376527f569a42f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
