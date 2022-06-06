# system requirements: ghostscript
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=grImport
_pkgver=0.9-5
pkgname=r-${_pkgname,,}
pkgver=0.9.5
pkgrel=4
pkgdesc='Importing Vector Graphics'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-xml
  ghostscript
)
optdepends=(
  r-cluster
  r-colorspace
  r-lattice
  r-survival
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6a44b5d07571b6aef561e7e60fbcfa5fb7c98ab17f016e99bf0cdcc70b617f5d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
