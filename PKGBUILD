# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenSA
_pkgver=1.1.10.1
pkgname=r-${_pkgname,,}
pkgver=1.1.10.1
pkgrel=1
pkgdesc='Generalized Simulated Annealing'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9093384941b5626aae2acf4835b591875193a6000d1f0b212abeaf682652949b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
