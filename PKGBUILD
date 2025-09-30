# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylInheritance
_pkgver=1.32.1
pkgname=r-${_pkgname,,}
pkgver=1.32.1
pkgrel=1
pkgdesc='Permutation-Based Analysis associating Conserved Differentially Methylated Elements Across Multiple Generations to a Treatment Effect'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-iranges
  r-methylkit
  r-rebus
  r-s4vectors
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-methinheritsim
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bdb7005a7a3acb2f839876037268e016ecbd723d05973cda71bedf2b98ac4baa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
