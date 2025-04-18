# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gep2pep
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Creation and Analysis of Pathway Expression Profiles (PEPs)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-digest
  r-foreach
  r-gseabase
  r-iterators
  r-repo
  r-rhdf5
  r-xml
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
  r-writexls
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6f7b75fc0f6a207a6d46dcbbe755517243b18ed0e06e4e1acb0bb14931619d82')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
