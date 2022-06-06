# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uniqtag
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=1.0
pkgrel=4
pkgdesc='Abbreviate Strings to Short, Unique Identifiers'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a88c021901511383c20d4045f69dd5d58480f85a672817b80c76ecf66b38b808')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
