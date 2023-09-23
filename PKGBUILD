# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=skmeans
_pkgver=0.2-16
pkgname=r-${_pkgname,,}
pkgver=0.2.16
pkgrel=1
pkgdesc='Spherical k-Means Clustering'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-clue
  r-slam
)
optdepends=(
  r-kmndirs
  r-matrix
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3aab34ab867cf53deafc3f16164bf8fed73ac4543897f1a1903b0682e5742f66')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
