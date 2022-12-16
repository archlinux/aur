# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LEA
_pkgver=3.10.1
pkgname=r-${_pkgname,,}
pkgver=3.10.1
pkgrel=1
pkgdesc='LEA: an R package for Landscape and Ecological Association Studies'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3c6e9eaa300389cfb84dc86888fabd823fd78a62c741c482227a6bc62d6c02bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
