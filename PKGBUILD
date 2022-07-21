# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gld
_pkgver=2.6.5
pkgname=r-${_pkgname,,}
pkgver=2.6.5
pkgrel=1
pkgdesc='Estimation and Use of the Generalised (Tukey) Lambda Distribution'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-e1071
  r-lmom
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8294f7c033147aa9b559b152ec9d46d380234527d1ab03adbe46b80d5da68ee9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
