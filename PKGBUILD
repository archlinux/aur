# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOfuncR
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Gene ontology enrichment using FUNC'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-genomicranges
  r-gtools
  r-iranges
  r-mapplots
  r-rcpp
  r-vioplot
)
optdepends=(
  r-biocstyle
  r-homo.sapiens
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f5c6154af12cd0d813c208e02ba868b270ce1f503d2bd6bd429dfc2f98b16035')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
