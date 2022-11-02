# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DynDoc
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=1.76.0
pkgrel=1
pkgdesc='Dynamic document tools'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0bee877511766c478bbbb916fef58c24ad4d347089d9a1436af0da6b4f4a1d71')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
