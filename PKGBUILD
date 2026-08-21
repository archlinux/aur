# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=cvar
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=0.6.1
pkgrel=1
pkgdesc='Compute Expected Shortfall and Value at Risk for Continuous Distributions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gbutils
  r-rdpack
)
optdepends=(
  r-fgarch
  r-performanceanalytics
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1bdd5f89c14f6d269238371337fdd18933d68b282c6ab083d560bfc614ca764f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
