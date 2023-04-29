# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chipseq
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=3
pkgdesc='chipseq: A package for analyzing chipseq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-genomicranges
  r-iranges
  r-s4vectors
  r-shortread
)
optdepends=(
  r-biocstyle
  r-bsgenome
  r-bsgenome.mmusculus.ucsc.mm9
  r-genomicfeatures
  r-knitr
  r-txdb.mmusculus.ucsc.mm9.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('88a8f1a4651714538c260bb7d34c509a5877cab8bf2d4620ed6de1541b610361')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
