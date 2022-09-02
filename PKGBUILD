# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=progressr
_cranver=0.11.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="An Inclusive, Unifying API for Progress Updates"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=(r-digest)
optdepends=(
    r-beepr
    r-crayon
    r-pbmcapply
    r-progress
    r-purrr
    r-foreach
    r-plyr
    r-dofuture
    r-future
    r-future.apply
    r-furrr
    r-rstudioapi
    r-shiny
    r-commonmark
    r-base64enc
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('d8668c82348a20cca34bb18c0c94e6083dbb6dbea40615e07e4161aff7366cd9')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
