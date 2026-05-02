# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_cranname=pacman
_cranver=0.5.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools to more conveniently perform tasks associated with add-on packages."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=(
    r
    r-remotes
    r-methods
    r-stats
    r-utils
)
makedepends=()
optdepends=(
    r-biocmanager
    r-knitr
    r-lattice
    r-testthat
    r-xml
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('9ec9a72a15eda5b8f727adc877a07c4b36f8372fe7ed80a1bc6c2068dab3ef7c')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
