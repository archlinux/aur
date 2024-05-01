# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fmcsR
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Mismatch Tolerant Maximum Common Substructure Searching'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-chemminer
  r-runit
)
optdepends=(
  r-biocstyle
  r-knitcitations
  r-knitr
  r-knitrbootstrap
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8f14aa1c03d70664c28a9dd7925724f1250a468999a88bd25c7b724906cb1a20')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
