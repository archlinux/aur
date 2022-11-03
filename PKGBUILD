# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=breakpointR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Find breakpoints in Strand-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-biocgenerics
  r-breakpointrdata
  r-cowplot
  r-doparallel
  r-foreach
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-gtools
  r-iranges
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fd112be9e6c0f842366b39ee0a9b55c3d90431752ed148bb9757cd07e9202e48')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
