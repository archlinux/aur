# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfun
_pkgver=0.0.6
pkgname=r-${_pkgname,,}
pkgver=0.0.6
pkgrel=3
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
sha256sums=('59989ed260fcc71cd95487cf3493113a2d8a47d273d9a2f3e5e842609620511b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
