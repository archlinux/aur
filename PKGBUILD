# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rcdklibs
_pkgver=2.3
pkgname=r-${_pkgname,,}
pkgver=2.3
pkgrel=3
pkgdesc='The CDK Libraries Packaged for R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-rjava
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d733f5ca586ea5fe0a2325d3d281bd5b3ba5b48802b52e7ef837c7c0f4df329a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
