# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_pkgname=covr
_pkgver=3.6.3
pkgname=r-${_pkgname,,}
pkgver=3.6.3
pkgrel=1
pkgdesc='Test Coverage for Packages'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-crayon
  r-digest
  r-httr
  r-jsonlite
  r-rex
  r-withr
  r-yaml
)
optdepends=(
  r-covr
  r-curl
  r-dt
  r-htmltools
  r-knitr
  r-memoise
  r-mockery
  r-parallel
  r-r6
  r-rlang
  r-rmarkdown
  r-rstudioapi
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c0ce1846a4d12cd7d365ed1844c221cd8a40f50ea2c6d7d87f27c3e7deffa29e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
