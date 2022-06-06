# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stopwords
_pkgver=2.3
pkgname=r-${_pkgname,,}
pkgver=2.3
pkgrel=4
pkgdesc='Multilingual Stopword Lists'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-isocodes
)
optdepends=(
  r-covr
  r-quanteda
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c5ec1c6ab1bad1786d87d7823d4b63abc94d2fd84ed7d8e985906e96fb6321b2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
