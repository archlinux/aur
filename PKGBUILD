# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GA
_pkgver=3.2.5
pkgname=r-${_pkgname,,}
pkgver=3.2.5
pkgrel=1
pkgdesc='Genetic Algorithms'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-cli
  r-crayon
  r-foreach
  r-iterators
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-doparallel
  r-dorng
  r-knitr
  r-parallel
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fe04d36471b9f8de64ddd92fa9f3447140dfc31c93841a0e435f017c99a9d636')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
