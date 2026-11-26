# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=weaver
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=1.80.0
pkgrel=1
pkgdesc='Tools and extensions for processing Sweave documents'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
)
optdepends=(
  r-codetools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c59dcd06bb892d1c2e778a2007866d83df637bb287187f5c8147648d0e905237')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
