# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=imageHTS
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='Analysis of high-throughput microscopy-based screens'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-cellhts2
  r-e1071
  r-ebimage
  r-hwriter
  r-vsn
)
optdepends=(
  r-biocstyle
  r-mass
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('352a466202ead058b2c0cbb2314c23c56933dffe935d448f5c082d04b89e9788')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
