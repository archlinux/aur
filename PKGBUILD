# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svUnit
_pkgver=1.0.6
pkgname=r-${_pkgname,,}
pkgver=1.0.6
pkgrel=4
pkgdesc="'SciViews' - Unit, Integration and System Testing"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-covr
  r-datasets
  r-knitr
  r-markdown
  r-runit
  r-spelling
  r-svgui
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('263e6c03d6c2717dfd25b96d25f8019c9c98120de280a17224e0d79adba2d522')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
