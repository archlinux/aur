# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>
_cranname=jqr
_cranver=1.3.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Client for 'jq', a 'JSON' processor (<https://jqlang.github.io/jq/>), written in C."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=(
    r
    r-magrittr
    r-lazyeval
    jq
)
makedepends=(gcc)
optdepends=(
    r-jsonlite
    r-testthat
    )
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('bad81aa15a06a23eb07e34042dd8f00192ff80d01541ac3a587d98d3bd01c8f0')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
