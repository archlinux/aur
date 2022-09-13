# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=lintr
_pkgver=3.0.1
pkgname=r-${_pkgname,,}
pkgver=3.0.1
pkgrel=1
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
sha256sums=('cfb816bc3a8f47cedd0460396f93d5b19165b4abb3be31194a346a8204e7f9a2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
