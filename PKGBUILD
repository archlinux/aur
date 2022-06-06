# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logitT
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=1.54.0
pkgrel=1
pkgdesc='logit-t Package'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
)
optdepends=(
  r-spikeinsubset
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6a7baf33f63a3b0240eaa87bef409d6a1071c0dfa5b59f1787f415c536bc1e7d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
