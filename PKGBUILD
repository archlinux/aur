# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GreyListChIP
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
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
sha256sums=('e737d6e391656ecc3886a667fa00159c1cbca57d860693c347944acb3cbb4336')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
