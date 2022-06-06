# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=minet
_pkgver=3.54.0
pkgname=r-${_pkgname,,}
pkgver=3.54.0
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
sha256sums=('5531aea23ec8b14b690c1a35e10b0dbdb6c30af9cfab7fa5f538d189a5e0d260')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
