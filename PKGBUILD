# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nor1mix
_pkgver=1.3-0
pkgname=r-${_pkgname,,}
pkgver=1.3.0
pkgrel=4
pkgdesc='Normal aka Gaussian (1-d) Mixture Models (S3 Classes and Methods)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-cluster
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9ce4ee92f889a4a4041b5ea1ff09396780785a9f12ac46f40647f74a37e327a0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
