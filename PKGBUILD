# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pheatmap
_pkgver=1.0.12
pkgname=r-${_pkgname,,}
pkgver=1.0.12
pkgrel=4
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
sha256sums=('579d96ee0417203b85417780eca921969cda3acc210c859bf9dfeff11539b0c1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
