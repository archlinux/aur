# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>
_cranname=rnaturalearthdata
_cranver=1.0.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Vector map data from <https://www.naturalearthdata.com/>. Access functions are provided in the accompanying package 'rnaturalearth'."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('CC0')
depends=(
    r
)
makedepends=()
optdepends=(
    r-knitr
    r-testthat
    )
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('e1fefaf1ea575fe242402c933b531c90f0f18772f8efe47b97a221b7eefb1e4d')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
