# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfun
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=0.1.0
pkgrel=1
pkgdesc="Miscellaneous Functions for 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  r-rlang
)
optdepends=(
  r-ggnewscale
  r-ggplotify
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('59e5ca8936c4394732b352dabee6a85cb08b952d3f272e243db0171b44593e63')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
