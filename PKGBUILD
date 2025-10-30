# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowCyBar
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Analyze flow cytometric data using gate information'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-gplots
  r-vegan
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('948feb5e1a570c5c4cf038a5da3631731a5ce7c3fea248ab18bc4928adac7fb2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
