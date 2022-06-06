# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logging
_pkgver=0.10-108
pkgname=r-${_pkgname,,}
pkgver=0.10.108
pkgrel=4
pkgdesc='R Logging Package'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-crayon
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('85c91aa5a313f5f9fbb0394cda3f924a2495cca3cc5cd68dde0695fe3c20ed8d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
