# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=garfield
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='GWAS Analysis of Regulatory or Functional Information Enrichment with LD correction'
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
sha256sums=('48438a8816861962f86c6fda9f0b12791cd64d234cb03c2230975a8dd3a3a232')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
