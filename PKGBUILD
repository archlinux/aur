# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sigclust
_pkgver=1.1.0.1
pkgname=r-${_pkgname,,}
pkgver=1.1.0.1
pkgrel=1
pkgdesc='Statistical Significance of Clustering'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eacdb4b5598e64722e515e749a3ff3dc14e8a296836afdd0a17ab153a96a72e0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
