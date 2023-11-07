# Maintainer: Hu Butui <hot123tea123@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=lintr
_pkgver=3.1.1
pkgname=r-${_pkgname,,}
pkgver=3.1.1
pkgrel=1
pkgdesc="A 'Linter' for R Code"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-backports
  r-cyclocomp
  r-digest
  r-glue
  r-knitr
  r-rex
  r-xml2
  r-xmlparsedata
)
optdepends=(
  r-bookdown
  r-crayon
  r-data.table
  r-httr
  r-jsonlite
  r-mockery
  r-patrick
  r-rlang
  r-rmarkdown
  r-rstudioapi
  r-testthat
  r-tibble
  r-tufte
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bcf146f4e74e6bf132fcbee7c9a43cd9c8abb4787e76a4164fa20468c180871d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
