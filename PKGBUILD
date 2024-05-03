# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CAFE
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Chromosmal Aberrations Finder in Expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-annotate
  r-biobase
  r-biovizbase
  r-genomicranges
  r-ggbio
  r-ggplot2
  r-gridextra
  r-iranges
  tk
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('52e60001f9458a3fe3a0bfc4bb79abe798fce1fb092d7ca5b64e3b8f8ef301ef')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
