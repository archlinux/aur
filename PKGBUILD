# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=meshr
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='Tools for conducting enrichment analysis of MeSH'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocstyle
  r-category
  r-fdrtool
  r-knitr
  r-markdown
  r-meshdbi
  r-rmarkdown
  r-rsqlite
  r-s4vectors
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('94a59bd2773de1606a6a3570a5d92a36199e7d8c0a395e7af30bbb34528e8c57')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
