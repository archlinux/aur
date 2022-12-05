# Maintainer: Hu Butui <hot123tea123@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=languageserver
_pkgver=0.3.14
pkgname=r-${_pkgname,,}
pkgver=0.3.14
pkgrel=4
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
  r-processx
  r-purrr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('266fe5a074dfef7a61de2943d5ac7c4838149c66b695505c89c094776e30d460')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
