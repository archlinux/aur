# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Contributor: Grey Christoforo <first name at last name dot net>
_cranname=lattice
_cranver=0.20-44
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Trellis Graphics for R"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
optdepends=(r-kernsmooth r-mass r-latticeextra)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('57b908e3c7ada08a38ad857ee44f44fdf9cfa59d5d9500bda2ccc9c7e96cdb9b')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
