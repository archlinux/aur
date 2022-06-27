# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DiscriMiner
_pkgver=0.1-29
pkgname=r-${_pkgname,,}
pkgver=0.1.29
pkgrel=6
pkgdesc='Tools of the Trade for Discriminant Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-factominer
  r-mass
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5aab7671086ef9940e030324651976456f0e84dab35edb7048693ade885228c6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
