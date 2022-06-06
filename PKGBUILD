# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=smoothie
_pkgver=1.0-3
pkgname=r-${_pkgname,,}
pkgver=1.0.3
pkgrel=4
pkgdesc='Two-Dimensional Field Smoothing'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-fields
  r-spatialvx
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('086f2ed935ec2a26865f8776da91c7ba4f50988b4e6f535e57cdeb4db62231ab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
