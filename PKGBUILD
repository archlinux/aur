# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=tikzDevice
_pkgver=0.12.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="R Graphics Output in LaTeX Format"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2 GPL3)
depends=('r>=2.14.0' 'r-filehash>=2.3' r-png)
optdepends=(r-evaluate r-formatr r-ggplot2 r-knitr r-lattice r-maps r-scales r-stringr r-testthat r-withr)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('04db2163ca9acb640161fb84dfc492f16abc6f5acc0c64782c197457e15004ac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
