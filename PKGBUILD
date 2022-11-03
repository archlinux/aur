# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genomeIntervals
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=1.54.0
pkgrel=1
pkgdesc='Operations on genomic intervals'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-genomeinfodb
  r-genomicranges
  r-intervals
  r-iranges
  r-s4vectors
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1e8d586351515214191af4f6f657d128ef16a74ce4131ac4fa1347dc2040824e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
