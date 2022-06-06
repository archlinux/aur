# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spiky
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='Spike-in calibration for cell-free MeDIP'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bamlss
  r-biostrings
  r-blandaltmanleh
  r-bsgenome
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-iranges
  r-rsamtools
  r-s4vectors
  r-scales
)
optdepends=(
  r-biocmanager
  r-bsgenome.hsapiens.ucsc.hg38.masked
  r-bsgenome.mmusculus.ucsc.mm10.masked
  r-complexheatmap
  r-covr
  r-devtools
  r-equatiomatic
  r-kebabs
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
  r-universalmotif
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d93bdc9a1769db6ecdc30adaba56ad0096a7fc5c5155a7f3b801be4f73fbca59')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
