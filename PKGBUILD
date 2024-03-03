# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rcdklibs
_pkgver=2.9
pkgname=r-${_pkgname,,}
pkgver=2.9
pkgrel=1
pkgdesc='The CDK Libraries Packaged for R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-rjava
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ef91ad0411f35c5bafcec03b986c8bab99782b7be858a86d944877308ab1b4c1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
