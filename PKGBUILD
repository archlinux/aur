# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epigenomix
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Epigenetic and gene transcription data normalization and integration with mixture models'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-beadarray
  r-biobase
  r-biocgenerics
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-mcmcpack
  r-rsamtools
  r-s4vectors
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('021d9bdc6188ccc23e44667a0eff56e00ec62ec995a88b918c23c1a7d760fdd5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
