# Maintainer: Hu Butui <hot123tea123@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=languageserver
_pkgver=0.3.17
pkgname=r-${_pkgname,,}
pkgver=0.3.17
pkgrel=1
pkgdesc='Language Server Protocol'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-callr
  r-collections
  r-fs
  r-jsonlite
  r-lintr
  r-r6
  r-roxygen2
  r-stringi
  r-styler
  r-xml2
  r-xmlparsedata
)
optdepends=(
  r-covr
  r-magrittr
  r-mockery
  r-pacman
  r-processx
  r-purrr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4aa5f6bfd9e9ba2c404a4c1ca75ef9204a4b5a3e9d2441ac85aa56f7c4cf8ccb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
