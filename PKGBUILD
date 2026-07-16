# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GreyListChIP
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Grey Lists -- Mask Artefact Regions Based on ChIP Inputs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bsgenome
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-rsamtools
  r-rtracklayer
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4639abf16d968bf867fb917ab669e44aa4a0b172bc66e2d92f294fffce75758e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
