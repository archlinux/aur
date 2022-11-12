# system requirements: C++11
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=rjsoncons
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=1.0.0
pkgrel=1
pkgdesc="'C++' Header-Only 'jsoncons' Library for 'JSON' Queries"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSL')
depends=(
  r
  r-cpp11
  r-jsonlite
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f942064480e98fc62cc6f292ce14af84999037f09fc740daf39693907872cff8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
