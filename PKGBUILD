# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ontologyIndex
_pkgver=2.10
pkgname=r-${_pkgname,,}
pkgver=2.10
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
sha256sums=('c995d6d9df5ff9cfb81fb80f553fc0f392d2237ffa6dd8619fd8fbce745a3a42')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
