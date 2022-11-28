# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=rmgarch
_pkgver=1.3-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
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
sha256sums=('3bb8d6cff7c292b0823b37699dc371f371d63016aa09fd69319a9c2b8904e169')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
