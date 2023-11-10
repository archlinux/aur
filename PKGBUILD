# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASEB
_pkgver=1.46.3
pkgname=r-${_pkgname,,}
pkgver=1.46.3
pkgrel=1
pkgdesc='Predict Acetylated Lysine Sites'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('797561ff36b036921e82d824b4b3e7f81917229a361620951eb4141947a346b5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
