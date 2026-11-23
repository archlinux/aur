# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DMRcaller
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Differentially Methylated Regions caller'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-betareg
  r-biocmanager
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-inflection
  r-interactionset
  r-iranges
  r-rcpp
  r-rcpproll
  r-rsamtools
  r-s4vectors
  r-seqinfo
  r-stringr
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('74e17ad04a957f6bbe04bd3c8c1bf821f0dd42f67e510bc62606876783807bc7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
