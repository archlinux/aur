# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DrugVsDiseasedata
_pkgver=1.35.0
pkgname=r-${_pkgname,,}
pkgver=1.35.0
pkgrel=1
pkgdesc='Drug versus Disease Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('87415f03620eecf3af75f302d37e1a4d8e695fb1026aa3d4527f7b37f243e04a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
