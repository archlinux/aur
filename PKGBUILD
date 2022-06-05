# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=compositions
_pkgver=2.0-4
pkgname=r-${_pkgname,,}
pkgver=2.0.4
pkgrel=4
pkgdesc='Compositional Data Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bayesm
  r-robustbase
  r-tensora
)
optdepends=(
  r-combinat
  r-energy
  r-knitr
  r-rgl
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b9c7a3bf654fb02d9eb1b4a7566469b2f5232f3b2c1b324c02239fd31060faf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
