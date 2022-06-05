# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cMAP
_pkgver=1.15.1
pkgname=r-${_pkgname,,}
pkgver=1.15.1
pkgrel=5
pkgdesc='A data package containing annotation data for cMAP'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3bf24aca1ce63ebff4ac0172467ecd8acbb0c1f8a240cd0f8b8abd7c44fdf15f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
