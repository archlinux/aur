# system requirements: Internal files Xba.CQV, Xba.regions (or otherregions file)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RLMM
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=1
pkgdesc='A Genotype Calling Algorithm for Affymetrix SNP Arrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('51f3a51efde6dc0a45e07f8c358ec99ac4d4af32ce2782032b442fb4d4c9b166')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
