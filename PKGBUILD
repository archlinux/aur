# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=minet
_pkgver=3.56.0
pkgname=r-${_pkgname,,}
pkgver=3.56.0
pkgrel=1
pkgdesc='Mutual Information NETworks'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-infotheo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3fff8eadb29a1bca2c338e8440b332800792a9f0e25ad36dc6be0d5005f376f6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
