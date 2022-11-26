# Maintainer: Hu Butui <hot123tea123@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=lintr
_pkgver=3.0.2
pkgname=r-${_pkgname,,}
pkgver=3.0.2
pkgrel=3
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
  r-glue
  r-jsonlite
  r-knitr
  r-rex
  r-xml2
  r-xmlparsedata
)
optdepends=(
  r-covr
  r-httr
  r-mockery
  r-patrick
  r-pkgdown
  r-rmarkdown
  r-rstudioapi
  r-testthat
  r-tibble
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9f6a70affea78d2092f40a7ba8961615d48b0c4ae8044ec72a1422a4342d34c9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
