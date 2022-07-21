# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=lintr
_pkgver=3.0.0
pkgname=r-${_pkgname,,}
pkgver=3.0.0
pkgrel=2
pkgdesc="A 'Linter' for R Code"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-backports
  r-crayon
  r-cyclocomp
  r-digest
  r-httr
  r-jsonlite
  r-knitr
  r-rex
  r-rstudioapi
  r-testthat
  r-xml2
  r-xmlparsedata
)
optdepends=(
  r-mockery
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eeb1d428748311727b0453c6e6b0df2dbf5c15e35c6db1bef7f8d6ac94b177b4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
