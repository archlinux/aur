# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>
_cranname=dice
_cranver=1.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="This package provides utilities to calculate the probabilities of various dice-rolling events"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=(
    r
    r-gtools
)
makedepends=()
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('7a50fe5fa44286062f8eec8a7c27c2143bef1a6795f3bfdad8bc366d313d2c3e')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
