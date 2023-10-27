# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plyranges
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='A fluent interface for manipulating GenomicRanges'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-dplyr
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-magrittr
  r-rlang
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-tidyselect
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-covr
  r-ggplot2
  r-helloranges
  r-hellorangesdata
  r-knitr
  r-pasillabamsubset
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fcdcad1082fadd1a365dd2d2cc7d955601b737ecd4a567d888d2b445756297fc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
