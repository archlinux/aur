# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.code
_pkgver=0.0-4
pkgname=r-${_pkgname,,}
pkgver=0.0.4
pkgrel=3
pkgdesc='Assertions to Check Properties of Code'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertive.base
  r-assertive.properties
  r-assertive.types
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2f820474ed20e06f65b284962c87cd1e85220a11cc7fcde09716f0eee5821387')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
