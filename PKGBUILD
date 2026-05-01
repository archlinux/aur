# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BaseSpaceR
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='R SDK for BaseSpace RESTful API'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Apache')
depends=(
  r
  r-rcurl
  r-rjsonio
)
optdepends=(
  r-iranges
  r-rsamtools
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('88fdf3785cfc73bae208fbd7dcabcbfad3ecc64763af5b56d0f1906b2ca848f5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
