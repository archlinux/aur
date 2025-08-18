# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=tidytidbits
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=0.3.3
pkgrel=1
pkgdesc='A Collection of Tools and Helpers Extending the Tidyverse'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-extrafont
  r-forcats
  r-magrittr
  r-purrr
  r-rlang
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
)
optdepends=(
  r-survival
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8c6675302430d4edc5590743ea4c824b9772195911e92631812e4f2200f451b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
