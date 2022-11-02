# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pgca
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='PGCA: An Algorithm to Link Protein Groups Created from MS/MS Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d6312f34680f46a71a8875147c13ddacc5cd7637ba5dbe447b521ea4270e982d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
