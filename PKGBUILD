# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrayQuality
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=1.84.0
pkgrel=1
pkgdesc='Assessing array quality on spotted arrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-gridbase
  r-hexbin
  r-limma
  r-marray
  r-rcolorbrewer
)
optdepends=(
  r-heebodata
  r-mclust
  r-meebodata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('547d0800defe63f56ac432c713f10dcb4e1d5fdaaa70e32b535e92e1fb0b4b67')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
