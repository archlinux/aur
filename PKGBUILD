# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BadRegionFinder
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='BadRegionFinder: an R/Bioconductor package for identifying regions with bad coverage'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biomart
  r-genomicranges
  r-rsamtools
  r-s4vectors
  r-variantannotation
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a93e0c076b1c9d25628f64546ebfff444cc8aca2cef04ec31c3a4d5560c537a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
