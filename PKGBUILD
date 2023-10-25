# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEGseq
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='Identify Differentially Expressed Genes from RNA-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-qvalue
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4f8ed7a201a0fdb091a688791133a975f44757bb53e06b82ed0be2a7cb9af797')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
