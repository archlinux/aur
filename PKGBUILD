# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidytree
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=0.4.1
pkgrel=3
pkgdesc='A Tidy Tool for Phylogenetic Tree Data Manipulation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ape
  r-dplyr
  r-lazyeval
  r-magrittr
  r-pillar
  r-rlang
  r-tibble
  r-tidyr
  r-tidyselect
  r-yulab.utils
)
optdepends=(
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-testthat
  r-utils
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fbc4364d17e1b1c26ed06af0cdf36c88a5bc562fdbd4731ab179e30bba4009eb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
