# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=candisc
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=1.1.0
pkgrel=2
pkgdesc='Visualizing Generalized Canonical Discriminant and Canonical Correlation Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-car
  r-heplots
  r-insight
)
optdepends=(
  r-corrplot
  r-knitr
  r-mass
  r-rgl
  r-rmarkdown
  r-rpart
  r-rpart.plot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('75857923e65b265029aa544e26933b5feae14df0911a94c2cfd6bfed1b94d656')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
