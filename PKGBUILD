# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfun
_pkgver=0.0.8
pkgname=r-${_pkgname,,}
pkgver=0.0.8
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
  r-ggplotify
  r-knitr
  r-prettydoc
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9471a12fc7af203a419767b845e6b6c1e63c080370cb8f2dac80187194122273')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
