# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=akmbiclust
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=0.1.0
pkgrel=4
pkgdesc='Alternating K-Means Biclustering'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dcf98b48d5c94b99484623884edb8142dd4c98e850dbfc9f1acef84cb708b2a5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
