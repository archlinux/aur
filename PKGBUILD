# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=heatmap.plus
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=1.3
pkgrel=6
pkgdesc='Allows heatmap matrix to have non-identical X- and Y-dimensions. Allows multiple tracks of annotation for RowSideColors and ColSideColors'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${pkgver}.tar.gz")
sha256sums=('c3f263e9055b9dbcfcaa387c7ef7f09fa17db8997982590a3d2b14554275ee67')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
#  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
