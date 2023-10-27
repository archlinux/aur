# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vtpnet
_pkgver=0.42.0
pkgname=r-${_pkgname,,}
pkgver=0.42.0
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
sha256sums=('4f2520efa3c0bb0cc9272d63d3a20d72b8bbe50cf1dcc34d588ab1353edea014')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
