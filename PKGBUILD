# system requirements: tiff and jpeg libraries
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tiff
_pkgver=0.1-11
pkgname=r-${_pkgname,,}
pkgver=0.1.11
pkgrel=4
pkgdesc='Read and Write TIFF Images'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b8c3ea15114d972f8140541c7b01f5ce2e5322af1f63c1a083aaf766fd3eec75')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
