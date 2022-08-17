# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tweedie
_pkgver=2.3.5
pkgname=r-${_pkgname,,}
pkgver=2.3.5
pkgrel=1
pkgdesc='Evaluation of Tweedie Exponential Family Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-stabledist
  r-statmod
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('983c745fee5a780d46e8dd04c2eb1c10cb2e222d3679654f0d6934d3db7b1c3e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
