# system requirements: C++17, libpng, cairo, freetype2, fontconfig
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=httpgd
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=1.3.0
pkgrel=3
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
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f3d6cdac150a8209283121e1394c8e27dd4cb89ecae1c436fb5f5bf774f3f35f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
