# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shadowtext
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=0.1.3
pkgrel=1
pkgdesc='Shadow Text Grob and Layer'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  r-scales
)
optdepends=(
  r-knitr
  r-prettydoc
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('861af6ff3401e34e4e5a996fde277cefb7554af24bb22459367c1f391ac12b81')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
