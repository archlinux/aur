# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=funtooNorm
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Normalization Procedure for Infinium HumanMethylation450 BeadChip Kit'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomeinfodb
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylation450kmanifest
  r-matrixstats
  r-minfi
  r-pls
)
optdepends=(
  r-knitr
  r-minfidata
  r-prettydoc
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4bc64adb387e1a235276d8299375835e2e1b3c7aca38fcbf30094ce60c9cb295')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
