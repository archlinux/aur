# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: getzze <getzze@gmail.com>
_cranname=rgeos
_cranver=0.5-9
_updatedate=2022-06-24
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc='Interface to Geometry Engine - Open Source (GEOS) using the C-API for topology operations on geometries.'
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(r r-cli geos)
makedepends=()
optdepends=()
replaces=(r-geos)
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('ab90cbfe6a3680a9d2eed5e655064a075adc66788e304468969ab7cc2df0e3d4')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
