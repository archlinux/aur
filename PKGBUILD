# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biclust
_pkgver=2.0.3
pkgname=r-${_pkgname,,}
pkgver=2.0.3
pkgrel=4
pkgdesc='BiCluster Algorithms'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-additivitytests
  r-colorspace
  r-flexclust
  r-ggplot2
  r-tidyr
)
optdepends=(
  r-isa2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('97b6927e580a188b218377a37bb37cbfe9de54bee8a8c759311936029c60fe51')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
