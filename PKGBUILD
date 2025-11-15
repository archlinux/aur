# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_cranname=inflection
_cranver=1.3.7
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Implementation of methods Extremum Surface Estimator (ESE) and Extremum Distance Estimator (EDE) to identify the inflection point of a curve."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=(
    r
    r-parallel
    r-stats
    r-graphics
    r-grdevices
)
makedepends=()
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('fc32c772069c6ca245728f27cb524aaf57ca812f6197f5bb201009dee2790211')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
