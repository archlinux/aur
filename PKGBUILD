# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Polychrome
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=1.5.1
pkgrel=1
pkgdesc='Qualitative Palettes with Many Colors'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-colorspace
  r-scatterplot3d
)
optdepends=(
  r-ggplot2
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6fe7da62459d7b94b1a8516a4626971cf35b76331f46e36798b05d29aa00d143')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
