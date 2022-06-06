# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=inveRsion
_pkgver=1.43.0
pkgname=r-${_pkgname,,}
pkgver=1.43.0
pkgrel=1
pkgdesc='Inversions in genotype data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-haplo.stats
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('636acd54444a9fc418469e3e2b3f0f222144f0be8403748e874274e23a085840')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
