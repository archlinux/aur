# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=riboSeqR
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Analysis of sequencing data from ribosome profiling experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-bayseq
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-rsamtools
  r-seqlogo
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e52f979f928b2f749cfc085eda295f5794f2febf49dbde2f405151882c12185c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
