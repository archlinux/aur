# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=english
_pkgver=1.2-6
pkgname=r-${_pkgname,,}
pkgver=1.2.6
pkgrel=4
pkgdesc='Translate Integers into English'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-utils
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('49578a39b813d3497a960cb50a78d611fb367c9d1587bb438f4372748baf76bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
