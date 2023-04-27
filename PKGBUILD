# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GraphAlignment
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
pkgrel=1
pkgdesc='GraphAlignment'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9ff9fbe8930768c53bfa0df766bd3e5629bfa8885f9d317293559cb778ee75ff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
