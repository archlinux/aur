# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_cranname=widyr
_cranver=0.1.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Encapsulates the pattern of untidying data into a wide matrix, performing some processing, then turning it back into a tidy form."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=(
    r
    r-broom
    r-dplyr
    r-matrix
    r-purrr
    r-reshape2
    r-tibble
    r-tidyr
    r-tidytext
)
makedepends=(gcc)
optdepends=(
    )
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('d61906589bfd24ff3e4cb0db7a1be5e337a1057dbdaeffbbc2faba4c35046014')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
