# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrayQuality
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=1.78.0
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
sha256sums=('ade30c664668522e880550d34b4327c377c8684707aa10c3267f8478894f0553')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
