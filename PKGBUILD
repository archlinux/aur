# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FunChIP
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Clustering and Alignment of ChIP-Seq peaks based on their shapes'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-doparallel
  r-fda
  r-foreach
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-rcolorbrewer
  r-rcpp
  r-rsamtools
  r-shiny
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8d7d879683399b3ead213c567193206056448e2d6809bce50111134a210e127d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
