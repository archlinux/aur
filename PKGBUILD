# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gam
_pkgver=1.22-1
pkgname=r-${_pkgname,,}
pkgver=1.22.1
pkgrel=1
pkgdesc='Generalized Additive Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-foreach
)
optdepends=(
  r-interp
  r-testthat
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fba1dc23ceadb2452aaf2e1c6c7cbd05273575bdba610d93d573f1a33b9d04c1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
