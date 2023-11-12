# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEGseq
_pkgver=1.56.1
pkgname=r-${_pkgname,,}
pkgver=1.56.1
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
sha256sums=('92c49cb54946dedeb3f1309f812d4d12c276e1e008b40c4e0940a37339d4657a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
