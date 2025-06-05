# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pheatmap
_pkgver=1.0.13
pkgname=r-${_pkgname,,}
pkgver=1.0.13
pkgrel=1
pkgdesc='Pretty Heatmaps'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gtable
  r-rcolorbrewer
  r-scales
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4ac34d4c5f787624f45cc98a97b8c28295c57eb635d1523554252c5a583142f7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
