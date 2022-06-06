# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kpeaks
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=1.1.0
pkgrel=4
pkgdesc='Determination of K Using Peak Counts of Features for Clustering'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0d5e857aa09fdb43189a9626b55327e231bbf669c3e420f3fb0c53042c76fd14')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
