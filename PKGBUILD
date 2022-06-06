# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=mi
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=1.0
pkgrel=6
pkgdesc='Missing Data Imputation and Model Checking'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-arm
)
optdepends=(
  r-betareg
  r-foreign
  r-knitr
  r-lattice
  r-mass
  r-nnet
  r-parallel
  r-sn
  r-survival
  r-truncnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('34f44353101e8c3cb6bf59c5f4ff5b2391d884dcbb9d23066a11ee756b9987c0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
