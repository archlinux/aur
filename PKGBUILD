# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dixonTest
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=1.0.4
pkgrel=1
pkgdesc="Dixon's Ratio Test for Outlier Detection"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b8694e4c4123827f954dffd0a30fb8c7f9cf49d0ec66be4d79eba0f4834ee33f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
