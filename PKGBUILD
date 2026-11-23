# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shadowtext
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=0.1.6
pkgrel=1
pkgdesc='Shadow Text Grob and Layer'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggiraph
  r-ggplot2
  r-purrr
  r-rlang
  r-s7
  r-scales
)
optdepends=(
  r-knitr
  r-prettydoc
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aa9b9b3d4e11f6cd57476b798fa61780bb89a6bf5baac8be3707d87507ead870')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
