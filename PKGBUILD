# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ontologyIndex
_pkgver=2.11
pkgname=r-${_pkgname,,}
pkgver=2.11
pkgrel=1
pkgdesc='Functions for Reading Ontologies into R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('27f12d5b6e2cb9d0a68841a7298a2b6b21d3567a178e751f406991b336decd9e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
