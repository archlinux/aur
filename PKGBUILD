# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=sysfonts
_cranver=0.8.9
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Loading Fonts into R"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=(r)
optdepends=(r-curl r-jsonlite)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(52459c34a625a049d22ea6d6ab799428b954783da04a7c4487d47684b8659f88)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
