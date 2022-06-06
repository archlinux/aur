# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GlobalOptions
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=0.1.2
pkgrel=4
pkgdesc='Generate Functions to Get or Set Global Options'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-getoptlong
  r-knitr
  r-markdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('47890699668cfa9900a829c51f8a32e02a7a7764ad07cfac972aad66f839753e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
