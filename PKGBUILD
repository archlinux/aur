# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=muscle
_pkgver=3.50.0
pkgname=r-${_pkgname,,}
pkgver=3.50.0
pkgrel=1
pkgdesc='Multiple Sequence Alignment with MUSCLE'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Unlimited')
depends=(
  r
  r-biostrings
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c2117f375e4d2c94bd2a877c13a72a74ae7a3f409e641ee9cb03d4dae471360e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
