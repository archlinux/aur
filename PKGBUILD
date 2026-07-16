# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BasicSTARRseq
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Basic peak calling on STARR-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-s4vectors
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2f2cb6a543cdcfe01274fb6a01218e7b526c90f7c5dc5dd94f04d127cdb107a4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
