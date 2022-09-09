# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scam
_pkgver=1.2-13
pkgname=r-${_pkgname,,}
pkgver=1.2.13
pkgrel=1
pkgdesc='Shape Constrained Additive Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-nlme
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('33fd80394583ee9c909c5059fee1184ee3ca9325bd3cf40beaa12cfe8978e562')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
