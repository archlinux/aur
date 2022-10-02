# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: DuckSoft <realducksoft at gmail dot com>
# Contributor: Grey Christoforo <first name at last name dot net>
_cranname=lattice
_cranver=0.20-45
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Trellis Graphics for R"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
optdepends=(r-kernsmooth r-mass r-latticeextra)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('22388d92bdb7d3959da84d7308d9026dd8226ef07580783729e8ad2f7d7507ad')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
