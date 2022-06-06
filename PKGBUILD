# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=heatmaps
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Flexible Heatmaps for Functional Genomics and Sequence Features'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-ebimage
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-plotrix
  r-rcolorbrewer
)
optdepends=(
  r-bsgenome.drerio.ucsc.danrer7
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0f7cffdf261c0bf712b0c36169917f1e3417f6853d3b3769b6820feb305dec8c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
