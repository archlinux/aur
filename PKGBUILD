# system requirements: Internal files Xba.CQV, Xba.regions (or otherregions file)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RLMM
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=1
pkgdesc='A Genotype Calling Algorithm for Affymetrix SNP Arrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('74a25764fc156a430197e7d699022241a8a4eea35848e56bf4306afb544ee0c6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
