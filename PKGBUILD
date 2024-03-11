# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=coro
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=1.0.4
pkgrel=1
pkgdesc="'Coroutines' for R"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-rlang
)
optdepends=(
  r-knitr
  r-later
  r-magrittr
  r-promises
  r-reticulate
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8f21bf44ec46fa1da88e9232db5536f494cbd87aade3ef16957d27919f58cc64')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
