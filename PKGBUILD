# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aplpack
_pkgver=1.3.5
pkgname=r-${_pkgname,,}
pkgver=1.3.5
pkgrel=3
pkgdesc="Another Plot Package: 'Bagplots', 'Iconplots', 'Summaryplots', Slider Functions and Others"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  tk
)
optdepends=(
  r-jpeg
  r-png
  r-splines
  r-tcltk
  r-tkrplot
  r-utils
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4454bc05cf70d5f3690b211e46b89b90a817de768b986098a3500c84f8d2664f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
