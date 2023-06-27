# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggplotify
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=0.1.1
pkgrel=1
pkgdesc="Convert Plot to 'grob' or 'ggplot' Object"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  r-gridgraphics
  r-yulab.utils
)
optdepends=(
  r-aplot
  r-colorspace
  r-cowplot
  r-ggimage
  r-knitr
  r-lattice
  r-prettydoc
  r-rmarkdown
  r-utils
  r-vcd
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('33385d1caa185ff98983a117e9a6949844e4a2d1b0067ea668ad6763a0b68ef4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
