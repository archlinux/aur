# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mgsub
_pkgver=1.7.3
pkgname=r-${_pkgname,,}
pkgver=1.7.3
pkgrel=4
pkgdesc='Safe, Multiple, Simultaneous String Substitution'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c9ae2560fe2690bedc5248af3fc89e7ef2bc6c147d46ced28f9824584c3791d5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
