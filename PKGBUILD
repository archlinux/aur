# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BLMA
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='BLMA: A package for bi-level meta-analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-graph
  r-gsa
  r-limma
  r-metafor
  r-padog
  r-rontotools
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('012f01bc4a86e021c804bfc88249503ac126634df649a2984f0d65d7a539fa36')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
