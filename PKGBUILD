# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOmap
_pkgver=2.5-0
pkgname=r-${_pkgname,,}
pkgver=2.5.0
pkgrel=3
pkgdesc='Topographic and Geologic Mapping'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fields
  r-mba
  r-rpmg
  r-splancs
)
optdepends=(
  r-geomapdata
  r-maps
  r-rfoc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('82e5608eda7330632bc67aa662b649e7b7b3ccdfda6a18a19d2e3379e0db1093')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
