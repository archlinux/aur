# system requirements: C++17, libpng, cairo, freetype2, fontconfig
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=httpgd
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=1.3.1
pkgrel=4
pkgdesc="A 'HTTP' Server Graphics Device"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-cpp11
  r-later
  r-systemfonts
  libpng
  cairo
  freetype2
  fontconfig
)
optdepends=(
  r-fontquiver
  r-knitr
  r-rmarkdown
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6dbfe3aaf70a004abb92268a80816bb604033b094d46420ba14f3ffaf13adaee')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
