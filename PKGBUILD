# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCircos
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=1.2.2
pkgrel=4
pkgdesc='Circos 2D Track Plot'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5bbdc3baff2d22a8922685af02b2af07541a1bcf1914abd9c166850b4c550afc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
