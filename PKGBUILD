# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=evd
_pkgver=2.3-6
pkgname=r-${_pkgname,,}
pkgver=2.3.6
pkgrel=3
pkgdesc='Functions for Extreme Value Distributions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-akima
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8edb8bc4f06d246c4343fd923bb5d5df99724d6db8821bfd996220343a834cb6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
