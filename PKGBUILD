# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vtpnet
_pkgver=0.44.0
pkgname=r-${_pkgname,,}
pkgver=0.44.0
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
sha256sums=('d735d7579a84267661a0512776281b186273c588e11cb5be4b386f7ba0f424ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
