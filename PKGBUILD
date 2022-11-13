# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=coro
_pkgver=1.0.3
pkgname=r-${_pkgname,,}
pkgver=1.0.3
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
sha256sums=('4e7729b1b1461be7805b2fcad0ed4c04755390dad3f1a2cb9f3af701db6d7d73')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
