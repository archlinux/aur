# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_cranname=ggquiver
_cranver=0.3.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="An extension of 'ggplot2' to provide quiver plots to visualise vector fields."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=(
    r
    r-ggplot2
)
makedepends=()
optdepends=(
    r-dplyr
    r-maps
    r-sf
    r-pkgdown
    r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('d1f95e8a5258f391bacb4c7313a9cdf239fecf3d400a1e23214ebc6cea6297fb')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
