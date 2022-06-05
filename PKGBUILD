# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=cocor
_pkgver=1.1-3
pkgname=r-${_pkgname,,}
pkgver=1.1.3
pkgrel=7
pkgdesc='Comparing Correlations'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-rkward
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('22503ef02f450e2c60056d286603faa3ac0789fc45ed0b9e9788c6eb73f6df80')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
