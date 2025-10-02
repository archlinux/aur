# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>
_cranname=tailor
_cranver=0.1.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Postprocessors refine predictions outputted from machine learning models to improve predictive performance or better satisfy distributional limitations."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=(
    r
    r-dplyr
    r-hardhat
    r-purrr
    r-tibble
    r-tidyselect
)
makedepends=()
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('3a20c19f1afb8814ad14f525142986daf36cfe0a9e9f1fdc00a822c1579c01ea')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
