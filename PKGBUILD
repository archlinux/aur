# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vtpnet
_pkgver=0.40.0
pkgname=r-${_pkgname,,}
pkgver=0.40.0
pkgrel=1
pkgdesc='variant-transcription factor-phenotype networks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-doparallel
  r-foreach
  r-genomicranges
  r-graph
  r-gwascat
)
optdepends=(
  r-motifdb
  r-rgraphviz
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a4dbce6404be8c5db0ac6f33ad46017648f1d2d98bfc0a7ae77edf9835220612')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
