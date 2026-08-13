# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=rmgarch
_pkgver=1.4-2
pkgname=r-${_pkgname,,}
pkgver=1.4.2
pkgrel=1
pkgdesc='Multivariate GARCH Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bessel
  r-corpcor
  r-ff
  r-pcapp
  r-rcpp
  r-rcpparmadillo
  r-rsolnp
  r-rugarch
  r-shape
  r-spd
  r-xts
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('76ccc53bbb9f461411765531a13132a9fa40489c860bd406f4334bb23a2c660f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
