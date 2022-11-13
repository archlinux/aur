# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=tidytidbits
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
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
sha256sums=('e87093aab927c2d34626b88cdff1f2cfd3883ffde778f8d5794ad6b88a0975fd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
