# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=catnet
_pkgver=1.15.7
pkgname=r-${_pkgname,,}
pkgver=1.15.7
pkgrel=4
pkgdesc='Categorical Bayesian Network Inference'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0f09e439e66fc08108582d63359be211076080a073c873cea5b748096682b804')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
