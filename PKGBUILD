# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggstar
_pkgver=1.0.6
pkgname=r-${_pkgname,,}
pkgver=1.0.6
pkgrel=1
pkgdesc="Multiple Geometric Shape Point Layer for 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-cli
  r-ggiraph
  r-ggplot2
  r-gridextra
  r-rlang
  r-scales
)
optdepends=(
  r-knitr
  r-markdown
  r-prettydoc
  r-purrr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('22182dd062c9f67a7e83eb47455ba7f2a8916a5214719c0b7ab03807effc02a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
