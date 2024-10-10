# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_cranname=multidplyr
_cranver=0.1.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Partition a data frame across multiple worker processes to provide simple multicore parallelism."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=(
    r
    r-dplyr
    r-cli
    r-crayon
    r-tibble
    r-tidyselect
    r-vctrs
    r-qs
)
makedepends=()
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('92b75ed45e39d0525357e916d7a96e44cd943494670267621f8ea3173411d4a3')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
