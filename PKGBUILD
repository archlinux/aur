# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=agricolae
_pkgver=1.3-5
pkgname=r-${_pkgname,,}
pkgver=1.3.5
pkgrel=3
pkgdesc='Statistical Procedures for Agricultural Research'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-algdesign
  r-klar
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('83822535608b5307ca7d0067dbcf1ea3b7f2b1be17a52a55b72cc9f3c6bdec5d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
